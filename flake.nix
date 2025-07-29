{
  description = "Aqua Neovim Configuration - Reproducible Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Platform-specific packages
        platformPackages = if pkgs.stdenv.isDarwin then [
          # macOS specific packages
        ] else [
          # Linux specific packages
        ];
      in {
        # Development shell with all tools
        devShells.default = pkgs.mkShell {
          name = "aqua-neovim-env";
          
          buildInputs = with pkgs; [
            # Core editor and version control
            neovim
            git
            
            # Node.js ecosystem
            nodejs
            npm
            
            # Terminal tools for telescope and file management
            ripgrep          # for telescope grep
            fzf              # fuzzy finder
            delta            # better git diffs
            zoxide           # smart cd
            yazi             # terminal file manager
            lazygit          # git TUI
            
            # Image processing (for image.nvim)
            imagemagick
            
            # Build tools
            gnumake
            gcc
            
            # Language servers and development tools
            # Go
            go
            gopls
            
            # Rust
            rustc
            cargo
            rust-analyzer
            rustfmt
            
            # Python
            python3
            python3Packages.pip
            python3Packages.python-lsp-server
            
            # Java/JVM
            openjdk
            
            # Kotlin
            kotlin
            kotlin-language-server
            
            # JavaScript/TypeScript
            nodePackages.typescript-language-server
            nodePackages.prettier
            nodePackages.eslint_d
            
            # Lua
            lua-language-server
            stylua
            luarocks
            
            # Markdown
            marksman
            
            # Shell
            bash-language-server
            shellcheck
            shfmt
            
            # Other formatters and linters
            nodePackages.prettier
            
            # Optional but useful tools
            tmux
            curl
            wget
            unzip
            tar
          ] ++ platformPackages;
          
          shellHook = ''
            echo "🌊 Aqua Neovim Environment Loaded!"
            echo ""
            echo "📦 Available tools:"
            echo "  • Neovim: $(nvim --version | head -1)"
            echo "  • Node.js: $(node --version)"
            echo "  • Go: $(go version | cut -d' ' -f3)"
            echo "  • Rust: $(rustc --version | cut -d' ' -f2)"
            echo "  • Python: $(python3 --version | cut -d' ' -f2)"
            echo ""
            echo "🚀 Quick start:"
            echo "  • Run 'nvim' to start Neovim"
            echo "  • Run 'lazygit' for Git TUI"
            echo "  • Run 'yazi' for file manager"
            echo ""
            
            # Ensure nvim config is properly linked
            if [ ! -d "$HOME/.config/nvim" ]; then
              echo "⚠️  Neovim config not found at ~/.config/nvim"
              echo "   Make sure to clone this repo to ~/.config/nvim"
            else
              echo "✅ Neovim config found at ~/.config/nvim"
            fi
            
            # Set up environment variables
            export EDITOR=nvim
            export VISUAL=nvim
            
            # Add any custom PATH additions
            export PATH="$HOME/.local/bin:$PATH"
          '';
          
          # Environment variables
          env = {
            # Ensure tools can find each other
            GOPATH = "$HOME/go";
            GOBIN = "$HOME/go/bin";
            CARGO_HOME = "$HOME/.cargo";
            
            # Terminal settings for better experience
            TERM = "xterm-256color";
            
            # Locale settings
            LC_ALL = "C.UTF-8";
            LANG = "C.UTF-8";
          };
        };
        
        # Minimal shell for just neovim
        devShells.minimal = pkgs.mkShell {
          name = "aqua-neovim-minimal";
          buildInputs = with pkgs; [
            neovim
            git
            ripgrep
            fzf
            nodejs
            python3
          ];
          shellHook = ''
            echo "🌊 Aqua Neovim (Minimal) Environment Loaded!"
            export EDITOR=nvim
            export VISUAL=nvim
          '';
        };
        
        # Package the config itself
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "aqua-neovim-config";
          version = "1.0.0";
          src = ./.;
          
          installPhase = ''
            mkdir -p $out/share/nvim
            cp -r . $out/share/nvim/
          '';
          
          meta = with pkgs.lib; {
            description = "Aqua Neovim Configuration";
            homepage = "https://github.com/abisov/aqua-vim";
            license = licenses.mit;
            maintainers = [ "abisov" ];
          };
        };
        
        # Apps for easy running
        apps.default = flake-utils.lib.mkApp {
          drv = pkgs.writeShellScriptBin "aqua-nvim" ''
            if [ ! -d "$HOME/.config/nvim" ]; then
              echo "Setting up Aqua Neovim config..."
              mkdir -p "$HOME/.config"
              cp -r ${self.packages.${system}.default}/share/nvim "$HOME/.config/"
            fi
            exec ${pkgs.neovim}/bin/nvim "$@"
          '';
        };
      }
    );
}