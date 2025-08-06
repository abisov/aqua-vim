# Neo-tree - Project Tree Explorer

Neo-tree is a modern file tree plugin that provides a persistent sidebar with a traditional tree view, perfect for navigating large projects with deep folder structures.

## Opening Neo-tree

- `<leader>e` - Toggle Neo-tree sidebar
- `<leader>E` - Reveal current file in Neo-tree
- `<leader>ge` - Open Git status view

## Basic Navigation

### File and Directory Operations
- `<CR>` - Open file or expand/collapse directory
- `<Space>` - Toggle directory expansion (alternative to Enter)
- `<2-LeftMouse>` - Double-click to open file or toggle directory
- `<Esc>` - Cancel current operation
- `q` - Close Neo-tree window

### Window Management
- `S` - Open file in horizontal split
- `s` - Open file in vertical split
- `t` - Open file in new tab
- `w` - Open with window picker (choose which window to open file in)

### Directory Navigation
- `<BS>` - Navigate to parent directory
- `.` - Set current directory as root (change tree root)
- `R` - Refresh current directory

## File Operations

### Creating Files and Directories
- `a` - Add new file (shows path, just type filename)
- `A` - Add new directory
- Type the name and press `<CR>` to confirm

### File Management
- `r` - Rename file or directory
- `d` - Delete file or directory (with confirmation)
- `c` - Copy file or directory (prompts for destination)
- `m` - Move file or directory (prompts for destination)

### Clipboard Operations
- `y` - Copy file path to clipboard
- `x` - Cut file to clipboard
- `p` - Paste from clipboard

## Advanced Features

### Git Integration
Neo-tree shows git status with visual indicators:

**Git Status Symbols:**
- `✚` - Added files
- `` - Modified files  
- `✖` - Deleted files
- `󰁕` - Renamed files
- `` - Untracked files
- `` - Ignored files
- `󰄱` - Unstaged changes
- `` - Staged changes
- `` - Merge conflicts

**Git Navigation:**
- `[g` - Jump to previous git modified file
- `]g` - Jump to next git modified file

### Search and Filter

**Fuzzy Finding:**
- `/` - Fuzzy finder within current directory
- `D` - Fuzzy finder for directories only
- `#` - Fuzzy sorter (sort results by relevance)

**Filtering:**
- `f` - Filter files by pattern (type pattern and press Enter)
- `<C-x>` - Clear current filter
- `H` - Toggle hidden files visibility

**Fuzzy Finder Controls:**
- `<Down>` / `<C-n>` - Move cursor down in results
- `<Up>` / `<C-p>` - Move cursor up in results

### Sorting Options

Press `o` to open the sorting menu, then:
- `oc` - Sort by creation date
- `od` - Sort by diagnostics (errors/warnings first)
- `og` - Sort by git status
- `om` - Sort by modification date
- `on` - Sort by name (default)
- `os` - Sort by file size
- `ot` - Sort by file type

### Preview and Details
- `P` - Toggle preview pane (shows file content)
- `l` - Focus preview pane
- `i` - Show detailed file information
- `?` - Show help with all available commands

## Buffer and Git Status Views

### Buffer View
Switch to buffer view to see all open buffers in tree format:
- Shows all currently open files
- `bd` - Delete/close buffer
- Same navigation and sorting options as file view

### Git Status View (`<leader>ge`)
Dedicated view for git operations:
- `A` - Git add all files
- `ga` - Git add selected file
- `gu` - Git unstage selected file
- `gr` - Git revert selected file
- `gc` - Git commit
- `gp` - Git push
- `gg` - Git commit and push

## Configuration Highlights

### Visual Features
- **Rounded borders** for modern appearance
- **Indent markers** (`│`, `└`) for clear hierarchy
- **Folder icons** (closed: ``, open: ``, empty: `󰜌`)
- **Git status colors** for modified files
- **40-character width** sidebar for optimal space usage

### Performance Features
- **Lazy loading** for large directories
- **Character fade** for better visual hierarchy
- **Smart filtering** hides system files (`.DS_Store`, `thumbs.db`)
- **Gitignore awareness** respects `.gitignore` patterns

### Integration Features
- **Diagnostic integration** shows LSP errors/warnings
- **Git integration** with full status awareness
- **Window picker** for multi-window workflows
- **Clipboard integration** for system-wide file operations

## Workflow Tips

### Large Project Navigation
1. Keep Neo-tree open as persistent sidebar (`<leader>e`)
2. Use `<leader>E` to quickly locate current file in project structure
3. Expand folders to see project hierarchy at a glance
4. Use fuzzy finder (`/`) for quick navigation within directories

### Git Workflow Integration
1. Use `<leader>ge` to see all modified files
2. Navigate with `[g` / `]g` to jump between changed files
3. Visual git status indicators help identify file states
4. Sort by git status (`og`) to group modified files together

### Multi-file Operations
1. Use visual selection or multi-select for bulk operations
2. Copy/move files with `c` and `m` commands
3. Use clipboard operations (`y`, `x`, `p`) for cross-directory moves
4. Filter files (`f`) to work with specific file types

### Performance Optimization
- Close Neo-tree when not needed to save screen space
- Use refresh (`R`) if directory contents change externally
- Hidden file toggle (`H`) to reduce visual clutter
- Root directory changes (`.`) to focus on specific project areas

## Troubleshooting

**Neo-tree not showing files:**
- Press `R` to refresh the directory
- Check if files are hidden (press `H` to toggle)
- Verify you're in the correct directory (check tree root)

**Git status not updating:**
- Refresh with `R` after git operations
- Ensure you're in a git repository
- Check if files are gitignored

**Performance issues:**
- Close preview pane (`P`) if not needed
- Use filtering (`f`) to reduce visible files
- Consider changing root (`.`) to focus on smaller directory trees

**Keybinding conflicts:**
- Neo-tree uses `<leader>e` - conflicts resolved by moving Yazi to `<leader>fy`
- All Neo-tree bindings are scoped to Neo-tree window only