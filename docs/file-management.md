# File Management

This guide covers file management operations using Oil.nvim and Telescope in this Neovim configuration.

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

### Creating a New Project Structure

Using Oil:
1. Press `-` to open Oil
2. Press `d` to create directories: `src/`, `tests/`, `docs/`
3. Navigate into `src/` and press `%` to create `main.lua`
4. Save with `:w` to apply all changes

### Reorganizing Files

Using Oil:
1. Open Oil with `-`
2. Select files with visual mode (`V`)
3. Cut with `dd` or copy with `yy`
4. Navigate to new location
5. Paste with `p`
6. Save with `:w` to apply changes

### Finding and Opening Related Files

Using Telescope:
1. `<leader>ff` to find files by name
2. `<leader>fg` to search for content across files
3. `<leader>fb` to switch between open buffers
4. `<leader>fo` to reopen recently used files

## Tips and Best Practices

### Oil Tips
- Always save (`:w`) to apply changes - Oil shows a preview until saved
- Use visual mode for bulk operations
- Oil respects `.gitignore` by default
- You can edit file permissions by changing the permission column

### Telescope Tips
- Use fuzzy matching: type partial names with gaps
- Combine with git workflow: `<leader>gc` to find commits, then `<leader>ff` to find files
- Use `<C-q>` to send results to quickfix list for batch operations
- File browser supports all standard Telescope mappings

### Performance
- Oil is faster for bulk operations in single directories
- Telescope is better for finding files across large project structures
- Use `<leader>fE` (file browser in current dir) for quick local navigation

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