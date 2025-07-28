# Yazi File Manager Guide

Yazi is a blazing fast terminal file manager integrated into Neovim for efficient file navigation and management.

## Quick Reference

### Opening Yazi
- `<leader>e` - Open Yazi in current file's directory
- `<leader>ew` - Open Yazi in working directory

### Inside Yazi (Neovim Integration)
- `<Enter>` - Open file in current buffer
- `<C-v>` - Open file(s) in vertical split
- `<C-x>` - Open file(s) in horizontal split
- `<C-t>` - Open file(s) in new tab
- `<C-q>` - Send file(s) to quickfix list
- `<F1>` - Show help

## Navigation

### Basic Movement
- `j/k` or `↓/↑` - Move cursor down/up
- `h/l` or `←/→` - Go to parent/enter directory
- `<Enter>` - Enter directory or open file
- `<Backspace>` - Go to parent directory

### Quick Navigation
- `gg` - Go to top of list
- `G` - Go to bottom of list
- `<C-u>` - Page up
- `<C-d>` - Page down
- `gh` - Go to home directory
- `gd` - Go to downloads directory

### Advanced Navigation
- `z` - Navigate with zoxide (if installed)
- `1-9` - Switch to tab number (if multiple tabs)
- `[/]` - Previous/next tab

## File Operations

### Copy, Cut, Paste
- `y` - **Yank (copy)** selected files
- `x` - **Cut** files for moving
- `p` - **Paste** files
- `P` - **Paste with options** (overwrite/symlinks)

### File Management
- `d` - **Move to trash** (safe delete)
- `D` - **Delete permanently** (dangerous!)
- `r` - **Rename** file (or bulk rename if multiple selected)
- `a` - **Create** file or directory (end with `/` for directories)
- `o` - **Open** with system default application

### Path Operations
- `cc` - **Copy file path** to clipboard
- `cf` - **Copy filename** to clipboard
- `cd` - **Copy directory path** to clipboard

## Selection and Bulk Operations

### Selection Methods
- `<Space>` - **Toggle selection** of current file
- `<C-a>` - **Select all** files in directory
- `v` - **Enter visual mode** for range selection
- `V` - **Exit visual mode**
- `<Esc>` - **Clear selection**

### Bulk Operations Workflow
```
1. Use <Space> to select multiple files
2. Or press 'v' and use j/k to select range
3. Press 'y' to copy all selected files
4. Navigate to destination directory
5. Press 'p' to paste all files
```

## Search and Filtering

### Search Options
- `s` - **Search files by name** (uses fd)
- `S` - **Search file contents** (uses ripgrep)
- `f` - **Filter files** in current directory
- `/` - **Find files incrementally** as you type

### Search Workflow
```
1. Press 's' for filename search
2. Type search term
3. Use j/k to navigate results
4. Press Enter to select file
5. Press Esc to exit search
```

## Sorting and Display

### Sorting Options
- `,a` - Sort **alphabetically**
- `,A` - Sort **reverse alphabetically**
- `,m` - Sort by **modified time**
- `,M` - Sort by **modified time (reverse)**
- `,s` - Sort by **file size**
- `,S` - Sort by **file size (reverse)**
- `,e` - Sort by **extension**
- `,n` - **Natural sort** (folders first)

### Display Options
- `.` - **Toggle hidden files** visibility
- `<Tab>` - **Show file information** panel
- `T` - **Toggle preview panel**
- `F` - **Full-size preview** mode

## Opening Files in Neovim

### Single Files
```
Navigation Method:
1. <leader>e (open Yazi)
2. Navigate to file with j/k/h/l
3. Choose opening method:
   - <Enter>: Current buffer
   - <C-v>: Vertical split  
   - <C-x>: Horizontal split
   - <C-t>: New tab
```

### Multiple Files
```
Bulk Opening:
1. Select files with <Space>
2. Use opening shortcuts:
   - <C-v>: Opens all in vertical splits
   - <C-x>: Opens all in horizontal splits
   - <C-t>: Opens all in new tabs
```

### Integration with Neovim Workflow
```
Split Workflow:
1. Start with main file open
2. <leader>e (open Yazi)
3. Navigate to related file
4. <C-v> (open in vertical split)
5. Now have side-by-side editing
6. Press 'q' to close Yazi
```

## Advanced Features

### Image Previews
- **Automatic previews** for PNG, JPG, GIF, SVG
- **PDF previews** with page navigation
- **Video thumbnails** for media files
- **Works in supported terminals** (Kitty, iTerm2, WezTerm)

### Git Integration
- **Git status indicators** next to filenames:
  - `M` - Modified files
  - `A` - Added files  
  - `D` - Deleted files
  - `?` - Untracked files
- **Repository-aware** operations

### Tab Management
- `t` - **Create new tab** in Yazi
- `<C-c>` - **Close current tab**
- `1-9` - **Switch to tab** by number
- `[/]` - **Navigate between tabs**

### Special Operations
- `u` - **Undo** last operation
- `<C-r>` - **Redo** last undone operation
- `q` - **Quit Yazi**
- `<C-z>` - **Suspend** to shell

## Neovim-Specific Integration

### Additional Keybindings (yazi.nvim)
- `<C-s>` - **Search with Telescope** in current directory
- `<C-y>` - **Copy relative path** to clipboard
- `<Tab>` - **Jump to open buffers** in Neovim

### Quickfix Integration
```
Send to Quickfix:
1. Select files with <Space>
2. Press <C-q>
3. Files added to quickfix list
4. Use <leader>h/<leader>; to navigate quickfix
```

## Workflow Examples

### Code Review Workflow
```
1. <leader>e (open Yazi)
2. Navigate to file A, press <C-v> (split)
3. Navigate to file B, press <Enter> (open in right split)  
4. Now comparing files side-by-side
5. Use <C-h>/<C-l> to switch between splits
```

### Asset Management Workflow
```
1. <leader>e (open Yazi in assets directory)
2. Use j/k to browse images with previews
3. Select image with <Enter> to open
4. Or <C-t> to open in new tab
5. Perfect for web development assets
```

### Multi-file Editing
```
1. <leader>e (open Yazi)
2. Use <Space> to select related files
3. Press <C-t> to open all in tabs
4. Use gt/gT to switch between tabs
5. Edit multiple files efficiently
```

### Project Exploration
```
1. <leader>ew (open Yazi in project root)
2. Use 's' to search for specific files
3. Use git indicators to see modified files
4. Open files with appropriate split/tab method
```

## Tips and Tricks

### Efficient File Management
- **Use visual mode** (`v`) for selecting file ranges
- **Bulk rename** by selecting multiple files and pressing `r`
- **Safe deletion** with `d` (moves to trash)
- **Quick creation** with `a` (type name, end with `/` for directories)

### Navigation Shortcuts
- **Bookmark common directories** using shell aliases
- **Use zoxide integration** (`z`) for quick directory jumping
- **Leverage search** (`s`) instead of manual navigation
- **Filter with** `f` to focus on specific file types

### Integration Best Practices
- **Open related files in splits** for side-by-side editing
- **Use tabs for different contexts** (implementation vs tests)
- **Send search results to quickfix** for systematic file processing
- **Combine with terminal workflow** for complete file management

### Performance Tips
- **Yazi is extremely fast** - leverage this for large directories
- **Use incremental search** (`/`) for real-time filtering
- **Preview panel** helps identify files without opening
- **Image previews** eliminate need to open files just to check content

## Troubleshooting

### Yazi Not Opening
- Ensure Yazi is installed: `brew install yazi` (macOS)
- Check plugin loaded: `:Lazy` and verify yazi.nvim
- Try manual command: `:Yazi`

### Files Not Opening in Splits/Tabs
- Make sure you're using Neovim integration keys (`<C-v>`, `<C-t>`, etc.)
- Standard Yazi keys may not integrate with Neovim
- Check yazi.nvim configuration in plugins.lua

### No Image Previews
- Check terminal support (Kitty, iTerm2 work best)
- Ensure terminal has proper image protocol support
- May need additional dependencies (Überzug++, Chafa)

### Performance Issues
- Yazi is generally very fast
- If slow, check directory permissions
- Large directories with many images may affect preview speed

## Comparison with Other File Managers

### vs Oil (`-` key)
**Use Yazi when:**
- Need image/media previews
- Working with large directories
- Want git status integration
- Need powerful search capabilities
- Bulk file operations

**Use Oil when:**
- Quick parent directory access
- Simple file renaming
- Minimal overhead needed
- Text-like file editing

### vs Telescope (`<leader>ff`)
**Use Yazi when:**
- Visual file browsing
- File operations (copy/move/delete)
- Image/media file management
- Directory exploration

**Use Telescope when:**
- Fuzzy filename searching
- Content searching in files
- Quick file opening by name
- Integration with other pickers

Yazi provides the most comprehensive file management experience with modern features, fast performance, and excellent Neovim integration!