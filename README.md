# Aqua Neovim Configuration

A modern, feature-rich Neovim configuration using lazy.nvim with comprehensive LSP support, testing, debugging, and Git integration.

## Prerequisites

### Required Software

#### Core Dependencies
- **Neovim** >= 0.9.0
- **Git** (for plugin management and Git integrations)
- **Node.js** and **npm** (for JavaScript/TypeScript tooling)
- **Python 3** with pip (for Python LSP and some formatters)

#### Terminal and Shell Tools
- **ripgrep** (`rg`) - for telescope grep functionality
- **fzf** - fuzzy finder
- **delta** - for better git diffs (used by telescope-undo)
- **zoxide** - smart cd command for directory navigation
- **yazi** - terminal file manager

#### Required External Binaries
Install these system-wide or they'll be auto-installed by Mason where possible:

##### Build Tools
- **make** (for telescope-fzf-native compilation)
- **gcc** or **clang** (C compiler for native extensions)

##### Language Servers (auto-installed via Mason)
- **gopls** - Go language server
- **rust-analyzer** - Rust language server
- **lua-language-server** - Lua LSP
- **typescript-language-server** - TypeScript/JavaScript LSP
- **astro-language-server** - Astro framework LSP
- **elixir-ls** - Elixir language server
- **jdtls** - Java language server
- **kotlin-language-server** - Kotlin LSP
- **marksman** - Markdown LSP
- **html-lsp** - HTML language server
- **json-lsp** - JSON language server
- **tailwindcss-language-server** - Tailwind CSS LSP
- **bash-language-server** - Bash LSP
- **dockerls** - Docker language server
- **pylsp** (Python-LSP-Server) - Python LSP
- **cucumber-language-server** - Cucumber/Gherkin LSP

##### Formatters (auto-installed via Mason)
- **prettier** / **prettierd** - JavaScript/TypeScript/JSON/CSS formatter
- **stylua** - Lua formatter
- **rustfmt** - Rust formatter
- **gofmt** - Go formatter
- **google-java-format** - Java formatter
- **ktlint** - Kotlin formatter
- **standardrb** - Ruby formatter
- **htmlbeautifier** - HTML/ERB formatter
- **beautysh** - Bash formatter
- **buf** - Protocol Buffer formatter
- **yamlfix** - YAML formatter
- **taplo** - TOML formatter
- **xmllint** - XML formatter

##### Linters (auto-installed via Mason)
- **eslint_d** - JavaScript/TypeScript linter
- **ktlint** - Kotlin linter
- **tflint** - Terraform linter
- **shellcheck** - Shell script linter

##### Debuggers (auto-installed via Mason)
- **delve** - Go debugger

#### Language-Specific Requirements

##### Swift Development
- **Xcode** (for sourcekit-lsp and Swift development)
  - Path configured: `/Applications/Xcode-beta.app/Contents/Developer`
  - Alternative: Xcode Command Line Tools

##### Ruby Development
- **Ruby** with bundler
- **standardrb** gem for formatting

##### Go Development
- **Go** compiler and tools

##### Java/Kotlin Development
- **Java JDK** 11+
- **Kotlin** compiler (optional, handled by LSP)

##### Rust Development
- **Rust** toolchain with cargo

##### Elixir Development
- **Elixir** and **Erlang/OTP**

##### JavaScript/TypeScript Development
- **Node.js** with npm/yarn/pnpm

#### Optional but Recommended

##### AI Coding Assistant
- **Ollama** (for CodeCompanion AI features)
  - Install and run: `ollama run qwen3`

##### Image Processing
- **ImageMagick** (for image.nvim plugin functionality)
- **magick** Lua rock (auto-installed via luarocks.nvim)

##### Git Tools
- **lazygit** - TUI git client
- **git-delta** - Better git diffs

##### Terminal Multiplexer
- **tmux** (for vim-tmux-navigator equivalent functionality)

## Installation

### 🚀 Quick Start with Nix (Recommended)

The easiest way to get up and running with all dependencies:

#### Prerequisites
- [Nix package manager](https://nixos.org/download.html) with flakes enabled
- Optional: [direnv](https://direnv.net/) for automatic environment loading

#### Using Nix Flakes (Recommended)
```bash
# Clone the configuration
git clone https://github.com/abisov/aqua-vim.git ~/.config/nvim

# Enter the development environment
cd ~/.config/nvim
nix develop

# Or run directly from anywhere
nix develop github:abisov/aqua-vim
```

#### With direnv (Auto-loading)
```bash
# Install direnv first
nix profile install nixpkgs#direnv

# Clone and enter directory
git clone https://github.com/abisov/aqua-vim.git ~/.config/nvim
cd ~/.config/nvim

# Allow direnv to load the environment
direnv allow

# Environment loads automatically when you cd into the directory
```

#### Available Nix Shells
- `nix develop` - Full development environment with all tools
- `nix develop .#minimal` - Minimal setup with just Neovim and core tools

**Benefits of the Nix approach:**
- ✅ Reproducible across different machines and OS
- ✅ No conflicts with system packages
- ✅ All dependencies pinned to specific versions
- ✅ Works on Linux, macOS, and Windows (WSL)
- ✅ Automatic cleanup when exiting shell

---

### 1. Manual Installation (Alternative)

If you prefer manual installation or don't want to use Nix:

#### macOS (using Homebrew)
```bash
# Core tools
brew install neovim git node ripgrep fzf delta zoxide yazi lazygit imagemagick

# Language-specific tools
brew install go rust python3 openjdk kotlin elixir

# Optional tools
brew install tmux
```

#### Ubuntu/Debian
```bash
# Core tools
sudo apt update
sudo apt install neovim git nodejs npm ripgrep fzf git-delta zoxide imagemagick

# Language-specific tools
sudo apt install golang-go rustc python3-pip openjdk-11-jdk

# Manual installation needed for: lazygit, yazi (check their GitHub releases)
```

#### Arch Linux
```bash
# Core tools
sudo pacman -S neovim git nodejs npm ripgrep fzf git-delta zoxide yazi lazygit imagemagick

# Language-specific tools  
sudo pacman -S go rust python-pip jdk-openjdk kotlin

# Optional
sudo pacman -S tmux
```

### 2. Clone Configuration

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this configuration
git clone <this-repo-url> ~/.config/nvim
```

### 3. First Launch

1. Start Neovim: `nvim`
2. Lazy.nvim will automatically install all plugins
3. Run `:Mason` to verify LSP servers are installing
4. Run `:checkhealth` to verify everything is working

### 4. Post-Installation Setup

#### Install Language Tools
Most tools will be auto-installed by Mason, but verify with:
```vim
:Mason
```

#### Configure Terminal (if using image.nvim)
Ensure you're using a compatible terminal for image display:
- **kitty** (configured by default in image.nvim)
- **iTerm2** with image support
- **wezterm** with image support
- Or disable image.nvim if not needed

## Key Features

### Plugin Management
- **lazy.nvim** - Modern plugin manager with lazy loading

### LSP & Completion
- **lsp-zero** - Simplified LSP configuration
- **nvim-cmp** - Autocompletion with multiple sources
- **mason.nvim** - LSP server, formatter, and linter management

### File Navigation
- **telescope.nvim** - Fuzzy finder for files, buffers, symbols
- **oil.nvim** - File explorer
- **yazi.nvim** - Terminal file manager integration
- **harpoon** - Quick file switching

### Git Integration
- **fugitive** - Git commands
- **gitsigns** - Git hunks and blame
- **diffview** - Advanced diff views and merge conflict resolution
- **lazygit** - Terminal Git UI
- **neogit** - Magit-like Git interface

### Testing & Debugging
- **neotest** - Test runner with adapters for Jest, RSpec, Minitest, Elixir, Go
- **nvim-dap** - Debug adapter protocol with language-specific configs

### Code Formatting & Linting
- **conform.nvim** - Formatter management
- **nvim-lint** - Linter integration

### AI Assistant
- **codecompanion.nvim** - AI coding assistance with Ollama backend

### Appearance
- **tokyonight** theme with transparency
- **lualine** - Status line
- **render-markdown** - Enhanced markdown rendering
- **image.nvim** - Image display in markdown

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json          # Plugin lockfile
├── lua/
│   ├── aqua/
│   │   ├── globals.lua     # Global variables
│   │   ├── options.lua     # Vim options
│   │   └── remaps.lua      # Key mappings
│   ├── plugins.lua         # Main plugin definitions
│   └── plugins/            # Specialized plugin configs
│       ├── lsp.lua         # LSP configuration
│       ├── telescope.lua   # Telescope setup
│       ├── gitsigns.lua    # Git integration
│       ├── diffview.lua    # Diff and merge tools
│       └── ...
├── ftplugin/               # Filetype-specific settings
│   ├── go.lua
│   └── java.lua
└── docs/                   # Documentation
    └── git-workflow.md     # Git workflow guide
```

## Key Bindings

### Leader Key
- **Space** (` `) - Leader and LocalLeader key

### Essential Bindings
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>gs` - Open Fugitive
- `<leader>lg` - Open LazyGit
- `<leader>e` - Open Yazi file manager
- `<leader>ft` - Open floating terminal
- `<leader>l` - Format current file
- `<leader>ll` - Run linter

### Testing & Debugging
- `<leader>t` - Run current test
- `<leader>tf` - Run all tests in file
- `<leader>dt` - Start debugger
- `<leader>b` - Toggle breakpoint

## Troubleshooting

### Common Issues

1. **LSP servers not working**
   - Run `:Mason` and install missing servers
   - Check `:LspInfo` for server status

2. **Formatters not working**
   - Ensure formatters are installed via Mason
   - Check `:ConformInfo` for formatter status

3. **Images not displaying**
   - Verify you're using a compatible terminal (kitty, iTerm2, wezterm)
   - Check ImageMagick installation: `magick --version`
   - Or disable image.nvim plugin if not needed

4. **Telescope grep not working**
   - Install ripgrep: `brew install ripgrep` or equivalent
   - Verify with: `rg --version`

### Health Checks
Run these commands in Neovim to diagnose issues:
- `:checkhealth` - Overall health check
- `:checkhealth telescope` - Telescope-specific checks
- `:checkhealth lsp` - LSP health check
- `:Mason` - Check installed tools

## Performance

This configuration is optimized for performance with:
- Lazy loading for most plugins
- Filetype-specific plugin loading
- Minimal startup time impact

Expected startup time: ~50-100ms on modern hardware.

## Support

For issues specific to this configuration, check:
1. Run `:checkhealth` first
2. Check plugin documentation for specific issues
3. Verify all system dependencies are installed
4. Review the configuration files for customization hints

## Contributing

Feel free to submit issues and enhancement requests. When contributing:
1. Test changes thoroughly
2. Update documentation as needed
3. Maintain the existing code style
4. Consider performance impact

