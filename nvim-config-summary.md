# Neovim Configuration Summary

## Core Configuration

**Files:**
- `init.lua` - Entry point, sets up lazy.nvim, auto-detects system theme (dark/light), custom highlight overrides, and utility commands
- `lua/aqua/options.lua` - Vim options (2-space tabs, relative numbers, clipboard, etc.)
- `lua/aqua/remaps.lua` - Keymaps (Oil, navigation, yank/delete, LSP, tests, debug, etc.)
- `lua/aqua/globals.lua` - Just a `P()` debug print function

---

## Plugins (60+ plugins organized)

### File Management
| Plugin | Purpose |
|--------|---------|
| **oil.nvim** | File explorer (replaces netrw), `<C-e>` to open |
| **neo-tree.nvim** | Sidebar file tree, `<leader>e` to toggle |
| **yazi.nvim** | Yazi file manager integration, `<leader>fy` |

### Fuzzy Finding (Telescope Ecosystem)
| Plugin | Purpose |
|--------|---------|
| **telescope.nvim** | Main fuzzy finder |
| **telescope-fzf-native.nvim** | FZF algorithm for speed |
| **telescope-file-browser.nvim** | File browser extension |
| **telescope-live-grep-args.nvim** | Live grep with args |
| **telescope-ui-select.nvim** | UI select replacement |
| **telescope-undo.nvim** | Browse undo history |
| **advanced-git-search.nvim** | Git search in telescope |
| **neoclip.lua** | Clipboard history manager |

### LSP & Completion
| Plugin | Purpose |
|--------|---------|
| **lsp-zero.nvim** | LSP configuration framework |
| **nvim-lspconfig** | LSP server configs |
| **mason.nvim** | LSP/tool installer |
| **mason-lspconfig.nvim** | Bridge mason + lspconfig |
| **nvim-cmp** | Autocompletion engine |
| **cmp-nvim-lsp**, **cmp-buffer**, **cmp-path**, **cmp-cmdline**, **cmp_luasnip** | Completion sources |
| **LuaSnip** + **friendly-snippets** | Snippet engine |
| **tiny-inline-diagnostic.nvim** | Inline diagnostic messages |

### Treesitter & Syntax
| Plugin | Purpose |
|--------|---------|
| **nvim-treesitter** | Syntax highlighting, parsing |
| **nvim-treesitter-textobjects** | Text objects (functions, classes) |
| **nvim-treesitter-context** | Show context at top of screen |
| **nvim-ts-autotag** | Auto-close HTML/JSX tags |
| **render-markdown.nvim** | Fancy markdown rendering |

### Git
| Plugin | Purpose |
|--------|---------|
| **gitsigns.nvim** | Git signs in gutter, hunk navigation |
| **diffview.nvim** | Diff viewer with file history |
| **vim-fugitive** | Classic git commands |
| **neogit** | Magit-like git interface |
| **lazygit.nvim** | LazyGit integration, `<leader>lg` |
| **advanced-git-search.nvim** | Git search in telescope |

### Debugging (DAP)
| Plugin | Purpose |
|--------|---------|
| **nvim-dap** | Debug adapter protocol |
| **nvim-dap-ui** | Debugger UI |
| **nvim-dap-ruby** | Ruby debugging |
| **nvim-dap-go** | Go debugging |
| **nvim-dap-virtual-text** | Virtual text for debug values |
| **mason-nvim-dap.nvim** | Auto-install debuggers |
| **nvim-dap-vscode-js** | VS Code JS debugger adapter |
| **one-small-step-for-vimkind** | Lua debugging |

### Testing
| Plugin | Purpose |
|--------|---------|
| **neotest** | Test runner framework |
| **neotest-rspec** | Ruby/RSpec adapter |
| **neotest-jest** | Jest adapter |
| **neotest-minitest** | Minitest adapter |
| **neotest-elixir** | Elixir adapter |
| **neotest-go** | Go adapter |
| **neotest-gradle** | Gradle adapter |

### UI & Visual
| Plugin | Purpose |
|--------|---------|
| **catppuccin** | Color theme (mocha/latte) |
| **lualine.nvim** | Status line with buffer tabs |
| **noice.nvim** | Better UI for messages/cmdline |
| **nvim-scrollbar** | Scrollbar with git/diagnostic marks |
| **nvim-ufo** | Code folding |
| **vim-illuminate** | Highlight word under cursor |
| **nvim-highlight-colors** | Show color previews |
| **image.nvim** | Display images in terminal |
| **snacks.nvim** | Dashboard, zen mode, buffer delete |

### Navigation & Motion
| Plugin | Purpose |
|--------|---------|
| **harpoon** | Quick file bookmarks |
| **flash.nvim** | Enhanced search/jump motions |
| **Navigator.nvim** | Tmux/nvim window navigation |
| **neoscroll.nvim** | Smooth scrolling |
| **marks.nvim** | Visual marks |

### Editing Enhancements
| Plugin | Purpose |
|--------|---------|
| **nvim-surround** | Surround text objects |
| **Comment.nvim** | Comment/uncomment |
| **nvim-autopairs** | Auto-close brackets |
| **vim-visual-multi** | Multiple cursors |
| **vim-repeat** | Better `.` repeat |

### Language-Specific
| Plugin | Purpose |
|--------|---------|
| **swift.vim** | Swift syntax |
| **xcodebuild.nvim** | Xcode integration |
| **nvim-jdtls** | Java/Kotlin LSP |
| **vim-rails** | Rails navigation |

### Terminal & Integration
| Plugin | Purpose |
|--------|---------|
| **toggleterm.nvim** | Terminal management |
| **fzf** | FZF binary |
| **zoxide.vim** | Zoxide directory jumping |

### Utilities
| Plugin | Purpose |
|--------|---------|
| **which-key.nvim** | Keymap hints |
| **undotree** | Undo history visualization |
| **trouble.nvim** | Diagnostics/quickfix UI |
| **conform.nvim** | Formatting (stylua, prettier, etc.) |
| **nvim-lint** | Linting (ktlint, tflint) |
| **octo.nvim** | GitHub PR/issue management |
| **vim-pencil** | Writing mode |
| **vim-projectionist** | Project navigation |
| **unimpaired.nvim** | Bracket mappings |
| **copilot.vim** | GitHub Copilot |
| **opencode.nvim** | AI assistant |

---

## Language Servers Configured

`eslint`, `ts_ls`, `angularls`, `cssls`, `emmet_ls`, `rust_analyzer`, `kotlin_language_server`, `jdtls`, `lua_ls`, `jsonls`, `html`, `elixirls`, `tailwindcss`, `tflint`, `pylsp`, `dockerls`, `bashls`, `marksman`, `cucumber_language_server`, `gopls`, `astro`, `sourcekit` (Swift)

---

## Key Categories to Consider Removing

1. **If you don't do Swift/iOS**: Remove `swift.vim`, `xcodebuild.nvim`, `sourcekit` LSP config
2. **If you don't use Java**: Remove `nvim-jdtls`, `google-java-format`
3. **If you don't use Ruby/Rails**: Remove `vim-rails`, `neotest-rspec`, `neotest-minitest`, `nvim-dap-ruby`, `standardrb`
4. **If you don't use Go**: Remove `neotest-go`, `nvim-dap-go`, `gopls`, `delve`
5. **If you don't use Elixir**: Remove `neotest-elixir`
6. **If you don't debug**: Remove all DAP plugins (10+ plugins)
7. **If you don't test in nvim**: Remove `neotest` and all adapters
8. **If you don't use tmux**: Remove `Navigator.nvim`
9. **Redundant file managers**: You have Oil, Neo-tree, and Yazi - pick one
10. **Multiple git UIs**: Fugitive, Neogit, LazyGit, Octo - pick favorites

---

## Stats

- **Total plugins**: ~60+
- **Language servers**: 22
- **Debug adapters**: 8
- **Test adapters**: 6
- **File managers**: 3
- **Git tools**: 6
