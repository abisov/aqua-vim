# Keybindings Reference

This document provides a comprehensive reference for all keybindings in this Neovim configuration.

**Leader Key**: `Space` (both leader and localleader)

## Table of Contents

- [Essential Navigation](#essential-navigation)
- [File Operations](#file-operations)
- [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
- [LSP (Language Server)](#lsp-language-server)
- [Code Editing](#code-editing)
- [Testing](#testing)
- [Debugging](#debugging)
- [Git Integration](#git-integration)
- [Terminal](#terminal)
- [Obsidian](#obsidian)
- [Visual Mode](#visual-mode)
- [Window Management](#window-management)
- [Utility](#utility)

## Essential Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `jj` | Insert | `<Esc>` | Exit insert mode |
| `<S-h>` | Normal/Visual/Operator | `^` | Jump to beginning of line |
| `<S-l>` | Normal/Visual/Operator | `g_` | Jump to end of line |
| `<C-d>` | Normal | `<C-d>zz` | Scroll down (centered) |
| `<C-u>` | Normal | `<C-u>zz` | Scroll up (centered) |
| `n` | Normal | `nzzzv` | Next search result (centered) |
| `N` | Normal | `Nzzzv` | Previous search result (centered) |
| `gj` | Normal | Navigate to next markdown header | Jump to next markdown header |
| `gk` | Normal | Navigate to previous markdown header | Jump to previous markdown header |

## File Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `-` | Normal | `:Oil --float` | Open parent directory in floating window |
| `<leader>q` | Normal | `:bd` | Close current buffer |
| `<leader>w` | Normal | `:bp\|bd #` | Close buffer but retain split |
| `<leader>cf` | Normal | Copy filename | Copy current file name to clipboard |
| `<leader>cp` | Normal | Copy file path | Copy current file path to clipboard |
| `<leader>x` | Normal | `chmod +x %` | Make current file executable |

## Telescope (Fuzzy Finder)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ff` | Normal | `find_files` | Find files in project |
| `<leader>fg` | Normal | `live_grep_args` | Live grep with arguments |
| `<leader>fc` | Normal | `live_grep` (exclude tests) | Live grep code files only |
| `<leader>fb` | Normal | `buffers` | Find open buffers |
| `<leader>fh` | Normal | `help_tags` | Find help tags |
| `<leader>fs` | Normal | `lsp_document_symbols` | Find document symbols |
| `<leader>fi` | Normal | `AdvancedGitSearch` | Advanced git search |
| `<leader>fo` | Normal | `oldfiles` | Find recently opened files |
| `<leader>fw` | Normal | `grep_string` | Find word under cursor |
| `<leader>gc` | Normal | `git_commits` | Search git commits |
| `<leader>gb` | Normal | `git_bcommits` | Search git commits for current buffer |
| `<leader>u` | Normal | `telescope undo` | Browse undo history |
| `<leader>Z` | Normal | `Zi` | Open Zoxide (directory jumper) |

## LSP (Language Server)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gd` | Normal | `vim.lsp.buf.definition` | Go to definition |
| `gr` | Normal | `vim.lsp.buf.references` | Go to references |
| `K` | Normal | `vim.lsp.buf.hover` | Show hover information |
| `<leader>vws` | Normal | `vim.lsp.buf.workspace_symbol` | Workspace symbols |
| `<leader>vd` | Normal | `vim.diagnostic.setloclist` | Show diagnostics |
| `[d` | Normal | `vim.diagnostic.goto_next` | Next diagnostic |
| `]d` | Normal | `vim.diagnostic.goto_prev` | Previous diagnostic |
| `<leader>vca` | Normal | `vim.lsp.buf.code_action` | Code actions |
| `<leader>vrr` | Normal | `vim.lsp.buf.references` | Show references |
| `<leader>vrn` | Normal | `vim.lsp.buf.rename` | Rename symbol |
| `<C-h>` | Insert | `vim.lsp.buf.signature_help` | Signature help |

## Code Editing

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>l` | Normal/Visual | Format code | Format file or selection |
| `<leader>ll` | Normal | Trigger linting | Run linter on current file |
| `Y` | Normal | `y$` | Yank to end of line |
| `==` | Normal | `gg<S-v>G` | Select all |
| `J` | Normal | `mzJ\`z` | Join lines (keep cursor position) |
| `<leader>y` | Normal/Visual | Yank to system clipboard | Copy to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard | Copy line to system clipboard |
| `<leader>d` | Normal/Visual | Delete to black hole | Delete without affecting registers |
| `<leader>s` | Normal | Search and replace | Replace word under cursor |
| `<leader><leader>` | Normal | Source current file | Reload current Lua file |

## Testing

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>t` | Normal | Run current test | Run test under cursor |
| `<leader>tf` | Normal | Run test file | Run all tests in current file |
| `<leader>td` | Normal | Run test directory | Run all tests in current directory |
| `<leader>tp` | Normal | Toggle test output panel | Show/hide test results |
| `<leader>tl` | Normal | Run last test | Re-run the last test |
| `<leader>ts` | Normal | Toggle test summary | Show/hide test summary |

## Debugging

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>dt` | Normal | `DapContinue` | Start/continue debugging |
| `<leader>dc` | Normal | `DapContinue` | Start/continue debugging |
| `<leader>dso` | Normal | `DapStepOver` | Step over |
| `<leader>dsi` | Normal | `DapStepInto` | Step into |
| `<leader>dsu` | Normal | `DapStepOut` | Step out |
| `<leader>dst` | Normal | `DapStepTerminate` | Stop debugger |
| `<leader>b` | Normal | Toggle breakpoint | Toggle breakpoint at current line |
| `<leader>B` | Normal | Conditional breakpoint | Set conditional breakpoint |
| `<leader>E` | Normal | Exception breakpoints | Toggle exception breakpoints |
| `<leader>dr` | Normal | Show DAP REPL | Open debugger REPL |
| `<leader>ds` | Normal | Show DAP scopes | Show variable scopes |
| `<leader>df` | Normal | Show DAP stacks | Show call stack |
| `<leader>db` | Normal | Show DAP breakpoints | Show all breakpoints |
| `<leader>do` | Normal | Toggle DAP UI | Show/hide debug UI |
| `<leader>dl` | Normal | Debug last test | Debug the last test |

## Git Integration

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>gs` | Normal | `:Git` | Open Fugitive (git status) |
| `]c` | Normal | Next git hunk | Navigate to next change |
| `[c` | Normal | Previous git hunk | Navigate to previous change |
| `<leader>hs` | Normal/Visual | Stage hunk | Stage current hunk |
| `<leader>hr` | Normal/Visual | Reset hunk | Reset current hunk |
| `<leader>hS` | Normal | Stage buffer | Stage entire buffer |
| `<leader>hu` | Normal | Undo stage hunk | Undo hunk staging |
| `<leader>hR` | Normal | Reset buffer | Reset entire buffer |
| `<leader>hp` | Normal | Preview hunk | Preview current hunk |
| `<leader>hb` | Normal | Blame line | Show git blame for line |
| `<leader>htb` | Normal | Toggle blame | Toggle current line blame |
| `<leader>hd` | Normal | Diff this | Show diff for current file |
| `<leader>hD` | Normal | Diff this (cached)` | Show diff against HEAD~ |
| `<leader>htd` | Normal | Toggle deleted | Show deleted lines |
| `ih` | Operator/Visual | Select hunk | Select current git hunk |

## Terminal

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ft` | Normal | Open FloatTerm | Open floating terminal |
| `<leader>flt` | Normal/Terminal | Toggle FloatTerm | Toggle floating terminal |
| `<C-t>` | Terminal | `<C-\><C-n>` | Exit terminal mode |

## Obsidian

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>oc` | Normal | Toggle checkbox | Toggle Obsidian checkbox |
| `<leader>ot` | Normal | Insert template | Insert Obsidian template |
| `<leader>oo` | Normal | Open in Obsidian | Open current file in Obsidian app |
| `<leader>ob` | Normal | Show backlinks | Show Obsidian backlinks |
| `<leader>ol` | Normal | Show links | Show Obsidian links |
| `<leader>on` | Normal | Create new note | Create new Obsidian note |
| `<leader>os` | Normal | Search Obsidian | Search Obsidian vault |
| `<leader>oq` | Normal | Quick switch | Quick switch between notes |

## Visual Mode

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `p` | Visual | `"_dP` | Paste without overwriting register |
| `<` | Visual | `<gv` | Indent left (stay in visual mode) |
| `>` | Visual | `>gv` | Indent right (stay in visual mode) |
| `J` | Visual | Move block down | Move selected block down |
| `K` | Visual | Move block up | Move selected block up |
| `//` | Visual | Search highlighted | Search for highlighted text |

## Window Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-S-Down>` | Normal | Resize horizontal split down | Increase horizontal split height |
| `<C-S-Up>` | Normal | Resize horizontal split up | Decrease horizontal split height |
| `<C-Left>` | Normal | Resize vertical split left | Decrease vertical split width |
| `<C-Right>` | Normal | Resize vertical split right | Increase vertical split width |

## Utility

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>h` | Normal | Next quickfix | Navigate to next quickfix item |
| `<leader>;` | Normal | Previous quickfix | Navigate to previous quickfix item |
| `<leader>k` | Normal | Next location list | Navigate to next location list item |
| `<leader>j` | Normal | Previous location list | Navigate to previous location list item |
| `<leader>vpp` | Normal | Edit plugins | Jump to plugins.lua file |
| `<leader>nd` | Normal | Dismiss Noice | Dismiss Noice notification |
| `Q` | Normal | `<nop>` | Disabled (no operation) |

## CodeCompanion (AI Assistant)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>co` | Normal/Visual | CodeCompanion actions | Open CodeCompanion actions menu |
| `<leader>ct` | Normal/Visual | Toggle CodeCompanion chat | Toggle CodeCompanion chat window |
| `<leader>ca` | Visual | Add to CodeCompanion chat | Add selection to CodeCompanion chat |

## Flash Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `s` | Normal/Visual/Operator | Flash jump | Jump to any visible location |
| `S` | Normal | Flash Treesitter | Jump using Treesitter |
| `r` | Operator | Remote Flash | Remote Flash operation |
| `R` | Operator/Visual | Treesitter Search | Treesitter search with Flash |
| `<C-s>` | Command | Toggle Flash Search | Toggle Flash in search mode |

## Octo (GitHub Integration)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>O` | Normal | Open Octo | Open Octo GitHub interface |
| `<leader>Op` | Normal | List PRs | List GitHub pull requests |

## Notes

- **Which-key**: Press `<leader>` and wait to see available keybindings
- **Treesitter text objects**: Use `af`/`if` for functions, `ac`/`ic` for classes, `aa`/`ia` for parameters
- **Treesitter navigation**: Use `]m`/`[m` for functions, `]]`/`[[` for classes
- **Auto-completion**: Use `<Tab>` and `<S-Tab>` to navigate completion menu
- **Telescope**: Use `<C-n>`/`<C-p>` to navigate, `<CR>` to select, `<C-c>` to close