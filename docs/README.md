# Neovim Configuration Documentation

Welcome to this comprehensive Neovim setup! This configuration provides a modern, feature-rich development environment with powerful plugins and customizations.

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Key Features](#key-features)
- [Configuration Structure](#configuration-structure)
- [Documentation](#documentation)

## Installation

### Prerequisites

Before installing this configuration, ensure you have the following dependencies:

**Required:**
- Neovim 0.9+ (latest stable recommended)
- Git
- A terminal with true color support
- A Nerd Font (for icons)

**Language-specific tools:**
- Node.js & npm (for JavaScript/TypeScript development)
- Go (for Go development)
- Java 11+ (for Java/Kotlin development)
- Ruby (for Ruby development)
- Rust (for Rust development)
- Python 3 (for various tools)

**Optional but recommended:**
- ImageMagick (for image.nvim plugin)
- ripgrep (for better searching)
- fd (for better file finding)
- lazygit (for git UI)

### Setup

1. **Backup existing configuration** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Wait for initial setup**: Lazy.nvim will automatically install all plugins on first launch.

5. **Install LSP servers and tools**:
   ```vim
   :Mason
   ```
   The required tools should install automatically, but you can manually install additional ones as needed.

## Quick Start

### Essential Keybindings

**Leader Key**: `Space`

**File Navigation:**
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find open buffers
- `-` - Open file browser (Oil)

**LSP & Code:**
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover information
- `<leader>l` - Format code
- `<leader>vca` - Code actions

**Testing:**
- `<leader>t` - Run current test
- `<leader>tf` - Run test file
- `<leader>tp` - Toggle test output panel

**Git:**
- `<leader>gs` - Open Fugitive (git status)
- `]c` / `[c` - Navigate git hunks
- `<leader>hs` - Stage hunk

### First Steps

1. **Explore files**: Press `<leader>ff` to open the file finder
2. **Search content**: Press `<leader>fg` to search across your project
3. **Open a file**: Navigate and edit some code
4. **Use LSP features**: Hover over symbols with `K`, go to definitions with `gd`
5. **Format code**: Press `<leader>l` to format the current file

## Key Features

### 🚀 Performance
- Lazy loading for fast startup times
- Optimized plugin configurations
- Efficient file navigation with Telescope

### 🔧 Development Tools
- **LSP Integration**: Full language server support with lsp-zero
- **Code Formatting**: Automatic formatting with conform.nvim
- **Linting**: Real-time linting with nvim-lint
- **Testing**: Integrated test running with neotest
- **Debugging**: Full debugging support with nvim-dap

### 🎨 User Interface
- **Theme**: Tokyo Night with transparency
- **Status Line**: Informative lualine configuration
- **File Explorer**: Oil.nvim for efficient file management
- **Notifications**: Beautiful notifications with noice.nvim

### 🌐 Language Support
- JavaScript/TypeScript
- Lua
- Go
- Java/Kotlin
- Ruby
- Rust
- Elixir
- Terraform
- Markdown
- And many more...

### 🔌 Notable Plugins
- **lazy.nvim**: Plugin manager
- **Telescope**: Fuzzy finder
- **Treesitter**: Syntax highlighting
- **LSP Zero**: LSP configuration
- **Mason**: Tool installer
- **Oil**: File manager
- **Neotest**: Test runner
- **DAP**: Debugger
- **Gitsigns**: Git integration
- **Harpoon**: Quick file switching

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lazy-lock.json          # Plugin version lockfile
├── lua/
│   ├── aqua/               # Core configuration modules
│   │   ├── globals.lua     # Global functions and utilities
│   │   ├── options.lua     # Neovim options and settings
│   │   └── remaps.lua      # Key mappings and autocommands
│   ├── plugins.lua         # Main plugin definitions
│   └── plugins/            # Individual plugin configurations
│       ├── lsp.lua         # LSP configuration
│       ├── telescope.lua   # Telescope setup
│       ├── harpoon.lua     # Harpoon configuration
│       └── ...
├── ftplugin/               # Filetype-specific configurations
│   ├── go.lua             # Go-specific settings
│   └── java.lua           # Java-specific settings
└── docs/                   # This documentation
    ├── README.md           # This file
    ├── keybindings.md      # Complete keybinding reference
    ├── plugins.md          # Plugin configuration guide
    └── troubleshooting.md  # Common issues and solutions
```

## Documentation

- **[Keybindings Reference](keybindings.md)** - Complete list of all keybindings
- **[Plugin Guide](plugins.md)** - Detailed plugin configurations and usage
- **[Troubleshooting](troubleshooting.md)** - Common issues and solutions

## Customization

This configuration is designed to be easily customizable:

1. **Add plugins**: Edit `lua/plugins.lua` or create new files in `lua/plugins/`
2. **Modify keybindings**: Edit `lua/aqua/remaps.lua`
3. **Change options**: Edit `lua/aqua/options.lua`
4. **Language-specific settings**: Add files to `ftplugin/`

## Getting Help

- Check the [troubleshooting guide](troubleshooting.md) for common issues
- Review the [keybindings reference](keybindings.md) for available shortcuts
- Use `:help` in Neovim for built-in documentation
- Use `<leader>` followed by any key to see available keybindings (which-key)

---

Happy coding! 🎉