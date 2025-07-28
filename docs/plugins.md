# Plugin Configuration Guide

This document provides detailed information about the plugins used in this Neovim configuration and how to customize them.

## Table of Contents

- [Plugin Manager](#plugin-manager)
- [Core Plugins](#core-plugins)
- [LSP and Completion](#lsp-and-completion)
- [File Navigation](#file-navigation)
- [Git Integration](#git-integration)
- [Testing and Debugging](#testing-and-debugging)
- [UI and Appearance](#ui-and-appearance)
- [Language Support](#language-support)
- [Productivity Tools](#productivity-tools)
- [Adding New Plugins](#adding-new-plugins)

## Plugin Manager

### lazy.nvim
**Location**: Bootstrapped in `init.lua`

Lazy.nvim is used as the plugin manager with performance optimizations:
- Lazy loading for fast startup
- Change detection disabled for notifications
- Plugin specifications in `lua/plugins.lua` and `lua/plugins/`

**Key commands**:
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing and update existing plugins

## Core Plugins

### Telescope
**File**: `lua/plugins/telescope.lua`
**Purpose**: Fuzzy finder for files, text, and more

**Configuration highlights**:
- Live grep with arguments support
- UI select integration
- Undo history browsing
- Advanced git search integration

**Customization**: Add new Telescope extensions by modifying the dependencies array.

### Oil.nvim
**File**: `lua/plugins.lua` (lines 53-85)
**Purpose**: File manager as a buffer

**Key features**:
- Float mode for quick navigation
- Trash support
- Hidden files visible
- Natural sorting

**Customization**: Modify the `setup()` options to change behavior, such as default view mode or keymaps.

### Treesitter
**File**: `lua/plugins.lua` (lines 262-353)
**Purpose**: Syntax highlighting and code understanding

**Supported languages**: JavaScript, TypeScript, Lua, Go, Java, Kotlin, and many more.

**Features enabled**:
- Syntax highlighting
- Smart indentation
- Incremental selection
- Text objects
- Code navigation

## LSP and Completion

### lsp-zero.nvim
**File**: `lua/plugins/lsp.lua`
**Purpose**: Simplified LSP configuration

**Key components**:
- **Mason**: LSP server installer
- **nvim-lspconfig**: LSP configurations
- **nvim-cmp**: Completion engine

**Adding new LSP servers**:
1. Add server name to `ensure_installed` in Mason configuration
2. Add any custom configuration in the `lsp.configure()` calls

### nvim-cmp
**Purpose**: Autocompletion engine

**Sources configured**:
- LSP completions
- Buffer text
- File paths
- Command line
- Snippets (LuaSnip)

### Conform.nvim
**File**: `lua/plugins.lua` (lines 148-192)
**Purpose**: Code formatting

**Supported formatters per language**:
- **Lua**: stylua
- **JavaScript/TypeScript**: prettierd/prettier
- **Go**: gofmt
- **Java**: google-java-format
- **Kotlin**: ktlint
- **Ruby**: standardrb
- **And many more...**

**Adding new formatters**:
```lua
formatters_by_ft = {
  your_language = { "your_formatter" },
}
```

### nvim-lint
**File**: `lua/plugins.lua` (lines 115-147)
**Purpose**: Linting integration

**Configured linters**:
- **JavaScript/TypeScript**: eslint_d
- **Kotlin**: ktlint
- **Terraform**: tflint

## File Navigation

### Neo-tree
**File**: `lua/plugins.lua` (lines 21-42)
**Purpose**: File tree sidebar

**Features**:
- Auto-close when last window
- Follow current file
- Git integration

**Command**: `:Neotree` to open

### Harpoon
**File**: `lua/plugins/harpoon.lua`
**Purpose**: Quick file switching

Allows marking and quickly switching between frequently used files.

## Git Integration

### Fugitive
**File**: `lua/plugins.lua` (lines 378-384)
**Purpose**: Git integration in Neovim

**Key command**: `:Git` for git status interface

### Gitsigns
**File**: `lua/plugins.lua` (lines 571-634)
**Purpose**: Git hunks in sign column

**Features**:
- Hunk navigation
- Staging/unstaging hunks
- Blame information
- Diff views

### Neogit
**File**: `lua/plugins.lua` (lines 43-51)
**Purpose**: Magit-like git interface

### Octo.nvim
**File**: `lua/plugins.lua` (lines 232-251)
**Purpose**: GitHub integration

**Features**:
- Pull request management
- Issue management
- Direct GitHub interaction from Neovim

## Testing and Debugging

### Neotest
**File**: `lua/plugins.lua` (lines 400-451)
**Purpose**: Test runner integration

**Supported test frameworks**:
- Jest (JavaScript/TypeScript)
- RSpec (Ruby)
- Minitest (Ruby)
- Elixir
- Go

**Adding new test adapters**:
Add to the `adapters` array in neotest setup.

### nvim-dap
**File**: `lua/plugins.lua` (lines 452-505)
**Purpose**: Debug Adapter Protocol integration

**Supported languages**:
- Ruby
- Go
- JavaScript/TypeScript (with separate configuration)

**UI**: nvim-dap-ui provides debugging interface

## UI and Appearance

### Tokyonight
**File**: `lua/plugins.lua` (lines 355-364)
**Purpose**: Color scheme

**Configuration**: Transparency enabled for sidebars and floats

### Lualine
**File**: `lua/plugins.lua` (lines 506-533)
**Purpose**: Status line

**Sections configured**:
- Mode, diff, diagnostics
- Filename with path
- File format, type, Noice status
- Progress and location

### Noice.nvim
**File**: `lua/plugins.lua` (lines 87-105)
**Purpose**: Enhanced UI for messages and command line

**Features**:
- Better command line interface
- Notification management
- LSP progress indicators

### Which-key
**File**: `lua/plugins.lua` (lines 680-692)
**Purpose**: Keybinding help

Shows available keybindings when you pause after pressing a key.

## Language Support

### Language-specific configurations:

**Java**: 
- `nvim-jdtls` for enhanced Java support
- Custom ftplugin configuration

**Go**:
- LSP support with gopls
- DAP debugging with delve

**Ruby**:
- Rails support with vim-rails
- RSpec testing integration

**JavaScript/TypeScript**:
- ESLint integration
- Jest testing support
- Autotag support for JSX/TSX

## Productivity Tools

### CodeCompanion
**File**: `lua/plugins.lua` (lines 703-738)
**Purpose**: AI coding assistant

**Features**:
- Chat interface
- Inline suggestions
- Ollama integration

### Obsidian.nvim
**File**: `lua/plugins/obsidian.lua`
**Purpose**: Obsidian vault integration

**Features**:
- Note creation and management
- Link navigation
- Template support

### Flash
**File**: `lua/plugins.lua` (lines 208-231)
**Purpose**: Quick navigation

Enhanced version of vim-sneak for jumping to any visible location.

### Surround
**File**: `lua/plugins.lua` (lines 534-541)
**Purpose**: Manipulate surrounding characters

Add, change, or delete surrounding quotes, brackets, tags, etc.

## Adding New Plugins

### Method 1: Add to main plugins.lua
Add a new plugin specification to the return table in `lua/plugins.lua`:

```lua
{
  "author/plugin-name",
  event = "VeryLazy", -- or other lazy loading trigger
  config = function()
    require("plugin-name").setup({
      -- configuration options
    })
  end,
}
```

### Method 2: Create separate file
For complex configurations, create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- detailed configuration
  end,
}
```

### Lazy Loading Strategies

**Common loading triggers**:
- `event = "VeryLazy"` - Load after startup
- `ft = {"filetype"}` - Load for specific file types  
- `cmd = {"Command"}` - Load when command is used
- `keys = {"<leader>key"}` - Load when key is pressed

### Best Practices

1. **Use lazy loading** to maintain fast startup times
2. **Group related plugins** in the same configuration file
3. **Document custom keybindings** in the configuration
4. **Test thoroughly** after adding new plugins
5. **Check for conflicts** with existing keybindings or functionality

### Plugin Management Commands

- `:Lazy check` - Check for plugin updates
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - View startup profiling
- `:Lazy log` - View plugin commit logs

---

For specific plugin documentation, use `:help plugin-name` or check the plugin's GitHub repository.