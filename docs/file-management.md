# File Management

This guide covers file management operations using Neo-tree, Oil.nvim, and Telescope in this Neovim configuration.

## Neo-tree - Project Tree Explorer

Neo-tree provides a persistent sidebar with a traditional tree view, perfect for navigating large projects with deep folder structures.

### Opening Neo-tree

- `<leader>e` - Toggle Neo-tree sidebar
- `<leader>E` - Reveal current file in Neo-tree
- `<leader>ge` - Open Git status view

### Navigation

- `<CR>` - Open file or expand/collapse directory
- `<Space>` - Toggle directory expansion
- `<BS>` - Navigate to parent directory
- `.` - Set current directory as root
- `S` - Open file in horizontal split
- `s` - Open file in vertical split
- `t` - Open file in new tab
- `w` - Open with window picker

### File Operations

**Creating:**
- `a` - Add new file
- `A` - Add new directory
- Type name and press `<CR>`

**File Management:**
- `r` - Rename file/directory
- `d` - Delete file/directory
- `c` - Copy file/directory
- `m` - Move file/directory
- `y` - Copy to clipboard
- `x` - Cut to clipboard
- `p` - Paste from clipboard

### Advanced Features

**Git Integration:**
- Git status indicators (✚ added, ✖ deleted, etc.)
- `[g` / `]g` - Navigate to prev/next git modified file
- Git status colors for modified files

**Search and Filter:**
- `/` - Fuzzy finder within current directory
- `D` - Fuzzy finder for directories only
- `H` - Toggle hidden files visibility
- `f` - Filter files (type pattern)
- `<C-x>` - Clear filter

**Sorting:**
- `o` - Show sorting options menu
- `on` - Sort by name
- `om` - Sort by modification time
- `os` - Sort by size
- `ot` - Sort by type
- `og` - Sort by git status

**View Options:**
- `P` - Toggle preview pane
- `i` - Show file details
- `R` - Refresh tree
- `?` - Show help
- `q` - Close Neo-tree

## Oil.nvim - Buffer-based File Manager

Oil treats directories as editable buffers, allowing you to manage files using familiar Vim operations.

### Basic Navigation

- `-` - Open Oil in current directory (floating window)
- `<CR>` - Enter directory or open file
- `<BS>` - Go to parent directory
- `q` - Close Oil buffer

### File Operations

**Creating Files/Directories:**
- `%` - Create new file
- `d` - Create new directory
- Type the name and press `<CR>`

**Renaming:**
- Navigate to the file/directory
- Press `R` or use normal Vim editing (change the name in the buffer)
- Save with `:w` to apply changes

**Moving Files:**
- Cut the line with `dd` or `x`
- Navigate to destination directory
- Paste with `p`
- Save with `:w` to apply the move

**Copying Files:**
- Yank the line with `yy`
- Navigate to destination directory  
- Paste with `p`
- Save with `:w` to apply the copy

**Deleting:**
- Navigate to the file/directory
- Delete the line with `dd`
- Save with `:w` to apply deletion

### Advanced Oil Features

**Bulk Operations:**
- Select multiple files with visual mode (`V`)
- Perform operations on selection
- Save with `:w` to apply all changes at once

**Undo/Redo:**
- Use `u` to undo changes before saving
- Use `<C-r>` to redo changes
- Changes are only applied when you save (`:w`)

## Telescope File Browser

Telescope file browser provides a tree-like interface for file management.

### Opening File Browser

- `<leader>fe` - Open file browser
- `<leader>fE` - Open file browser in current file's directory

### Navigation

- `<CR>` - Enter directory or open file
- `<BS>` - Go to parent directory
- `<C-j>/<C-k>` - Move up/down in list
- `<Tab>` - Toggle selection for multi-select operations

### File Operations

**Creating:**
- `c` - Create new file or directory
- Type name (end with `/` for directories)
- Press `<CR>` to confirm

**Renaming:**
- `r` - Rename selected file/directory
- Type new name and press `<CR>`

**Deleting:**
- `d` - Delete selected file/directory
- Confirm deletion when prompted

**Moving/Copying:**
- `m` - Move selected files
- `y` - Copy selected files
- Navigate to destination and confirm

### Advanced Features

**Hidden Files:**
- `h` - Toggle hidden file visibility
- Shows/hides dotfiles and system files

**Multi-select:**
- `<Tab>` - Toggle selection on current item
- `<S-Tab>` - Toggle selection and move up
- Perform operations on all selected items

**Search:**
- `/` - Search within current directory
- Type search term and navigate results

## File Finding with Telescope

### Quick File Access

- `<leader>ff` - Find files (respects .gitignore)
- `<leader>fo` - Find recently opened files
- `<leader>fb` - Find open buffers

### Content Search

- `<leader>fg` - Live grep with arguments
- `<leader>fc` - Live grep in code files (excludes tests)
- `<leader>fw` - Find word under cursor
- `<leader>/` - Fuzzy search in current buffer

### Advanced Search

**Live Grep with Arguments:**
- `<leader>fg` opens live grep with arguments
- Type search pattern, then `--` followed by file patterns
- Example: `search_term -- *.lua *.md`

**Git Integration:**
- `<leader>gc` - Search git commits
- `<leader>gb` - Search git commits for current buffer
- `<leader>fi` - Advanced git search

## Workflow Examples

### Large Project Navigation

Using Neo-tree for project overview:
1. `<leader>e` to open Neo-tree sidebar
2. Expand folders to see project structure
3. Use `<CR>` to navigate to files
4. Keep sidebar open for context while coding
5. `<leader>E` to reveal current file in tree

### Creating a New Project Structure

Using Neo-tree:
1. `<leader>e` to open Neo-tree
2. Navigate to desired location
3. Press `A` to create directories: `src/`, `tests/`, `docs/`
4. Press `a` to create files within directories
5. Tree updates automatically

Using Oil for quick edits:
1. Press `-` to open Oil
2. Press `d` to create directories: `src/`, `tests/`, `docs/`
3. Navigate into `src/` and press `%` to create `main.lua`
4. Save with `:w` to apply all changes

### Reorganizing Files

Using Neo-tree for visual organization:
1. Open Neo-tree with `<leader>e`
2. Use `c` to copy or `m` to move files
3. Navigate to destination in tree
4. Confirm operation

Using Oil for bulk operations:
1. Open Oil with `-`
2. Select files with visual mode (`V`)
3. Cut with `dd` or copy with `yy`
4. Navigate to new location
5. Paste with `p`
6. Save with `:w` to apply changes

### Finding and Opening Related Files

Multi-tool approach:
1. **Neo-tree** - Visual project structure, expand folders to find file locations
2. **Telescope** - `<leader>ff` to find files by name, `<leader>fg` for content search
3. **Oil** - Quick file operations and renames
4. **Telescope file browser** - `<leader>fe` for tree-like fuzzy finding

## Tips and Best Practices

### Neo-tree Tips
- Keep sidebar open for project context in large codebases
- Use `<leader>E` to quickly locate current file in project structure
- Git status indicators help identify modified files at a glance
- Use fuzzy finder (`/`) within Neo-tree for quick navigation
- Sort by git status (`og`) to see all modified files together

### Oil Tips
- Always save (`:w`) to apply changes - Oil shows a preview until saved
- Use visual mode for bulk operations
- Oil respects `.gitignore` by default
- Best for quick file operations and renames

### Telescope Tips
- Use fuzzy matching: type partial names with gaps
- Combine with git workflow: `<leader>gc` to find commits, then `<leader>ff` to find files
- Use `<C-q>` to send results to quickfix list for batch operations
- File browser supports all standard Telescope mappings

### Tool Selection Strategy
- **Neo-tree** - Project overview, navigation in large codebases, git status monitoring
- **Telescope** - Quick file finding, content search, fuzzy navigation
- **Oil** - Simple file operations, bulk edits, quick renames
- **Telescope file browser** - Tree-like navigation with fuzzy search capabilities

### Performance
- Neo-tree is optimized for large projects with lazy loading
- Oil is faster for bulk operations in single directories
- Telescope is best for finding files across large project structures
- Use the right tool for the task to maintain optimal performance

## Troubleshooting

**Oil not saving changes:**
- Make sure to press `:w` to save the buffer
- Check file permissions if save fails

**Telescope not finding files:**
- Check if files are in `.gitignore`
- Use `<leader>fe` (file browser) to navigate to hidden files
- Ensure ripgrep is installed for content search

**Performance issues:**
- Large directories may be slow in Oil - consider using Telescope instead
- For very large projects, use more specific search patterns in Telescope