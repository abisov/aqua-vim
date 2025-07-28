# Navigation Guide

This guide covers window splits, tabs, and navigation in this Neovim configuration.

## Quick Reference

### Split Management
- `<leader>wv` - Split current window vertically
- `<leader>wh` - Split current window horizontally
- `<leader>wt` - Send current buffer to new tab
- `<leader>wT` - Move current split to new tab

### Tab Management
- `<leader>Tn` - Create new tab
- `<leader>Tc` - Close current tab
- `<leader>To` - Close all other tabs
- `gt` - Next tab
- `gT` - Previous tab
- `<leader>Tm` - Move tab to end
- `<leader>TM` - Move tab to beginning

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to bottom window
- `<C-k>` - Move to top window
- `<C-l>` - Move to right window

### Window Resizing
- `<C-S-Up>` - Decrease horizontal split height
- `<C-S-Down>` - Increase horizontal split height
- `<C-Left>` - Decrease vertical split width
- `<C-Right>` - Increase vertical split width

## Working with Splits

### Creating Splits

**Vertical Split (`<leader>wv`)**
- Splits current window left/right
- Both sides show same buffer initially
- Use for side-by-side comparison

**Horizontal Split (`<leader>wh`)**
- Splits current window top/bottom
- Both sides show same buffer initially
- Use for viewing different parts of same file

### Split Workflows

**Side-by-side Editing:**
1. Open your main file
2. Press `<leader>wv` to split vertically
3. Navigate to different file with telescope/oil
4. Use `<C-h>` and `<C-l>` to switch between sides

**Top/Bottom Layout:**
1. Open your main file
2. Press `<leader>wh` to split horizontally
3. Bottom split often used for terminals or logs
4. Use `<C-j>` and `<C-k>` to switch between top/bottom

### Moving Splits to Tabs

**Send Buffer to New Tab (`<leader>wt`)**
- Creates new tab with current buffer
- Original split remains unchanged
- Useful for focusing on one file

**Move Split to New Tab (`<leader>wT`)**
- Moves current split to new tab
- Removes split from current tab
- Reorganizes your workspace

## Working with Tabs

### Tab Creation and Management

**New Tab (`<leader>Tn`)**
- Creates empty new tab
- Starts with current buffer
- Independent window layout

**Close Tabs:**
- `<leader>Tc` - Close current tab
- `<leader>To` - Close all tabs except current

### Tab Navigation

**Basic Navigation:**
- `gt` - Next tab (standard vim)
- `gT` - Previous tab (standard vim)
- Works with count: `3gt` goes to tab 3

**Tab Reordering:**
- `<leader>Tm` - Move current tab to end
- `<leader>TM` - Move current tab to beginning
- Use `:tabmove N` to move to specific position

### Tab Workflows

**Project Organization:**
1. Tab 1: Main code files
2. Tab 2: Tests and specs
3. Tab 3: Documentation
4. Tab 4: Configuration files

**Feature Development:**
1. Create new tab: `<leader>Tn`
2. Split for implementation: `<leader>wv`
3. Split for tests: `<leader>wh`
4. Switch tabs with `gt`/`gT` to compare with main

## Advanced Navigation Patterns

### Split + Tab Workflow
```
1. Start with main file
2. <leader>wv (split vertically)
3. Open related file in right split
4. <leader>wt (send to new tab for focus)
5. Continue working in tabs
6. Use gt/gT to switch contexts
```

### Multi-window Development
```
1. <leader>wv (vertical split)
   - Left: Implementation
   - Right: Interface/header
2. <leader>wh (horizontal split right side)
   - Top right: Interface
   - Bottom right: Tests
3. Navigate: <C-h/j/k/l>
```

### Tab-per-Feature Pattern
```
1. Main tab: Core implementation
2. <leader>Tn -> Feature A development
3. <leader>Tn -> Feature B development  
4. <leader>Tn -> Bug fixes
5. Switch contexts with gt/gT
```

## Integration with Other Features

### With File Navigation
- Use `-` (Oil) to open file browser
- `<leader>ff` (Telescope find files) in any split
- Files open in current active split

### With Terminals
- Terminal mappings use `<leader>t*` (lowercase t)
- Navigation mappings use `<leader>w*` and `<leader>T*` (uppercase T)
- No conflicts between systems
- Terminals open in splits, can be moved to tabs with `<leader>wt`

### With Buffer Management
- `<leader>q` - Close buffer
- `<leader>w` - Close buffer, keep split (note: different from `<leader>w*` window operations)
- `<leader>fb` - Find buffers (Telescope)

**Note**: `<leader>w` (close buffer, keep split) is different from `<leader>w*` (window operations like `<leader>wv`, `<leader>wh`)

## Tips and Tricks

### Efficient Split Creation
- Split, then immediately open different file
- Use telescope in new split to quickly switch content
- `<leader>wv` + `<leader>ff` = quick side-by-side

### Tab Organization
- Keep related files in same tab
- Use descriptive names if needed (`:file newname`)
- Close unused tabs regularly with `<leader>To`

### Window Sizing
- Use arrow keys with Ctrl/Shift for fine control
- Equal splits: `<C-w>=`
- Maximize current: `<C-w>_` (height) or `<C-w>|` (width)

### Navigation Shortcuts
- `<C-w>w` - Cycle through windows
- `<C-w>x` - Exchange windows
- `<C-w>r` - Rotate windows

## Common Scenarios

### Code Review
1. `<leader>wv` - Split vertically
2. Left: Current version
3. Right: Modified version  
4. Use `<C-h>/<C-l>` to compare

### Debugging
1. `<leader>wh` - Split horizontally
2. Top: Source code
3. Bottom: Terminal with debugger
4. Navigate with `<C-j>/<C-k>`

### Documentation Writing
1. `<leader>Tn` - New tab for docs
2. `<leader>wv` - Split for reference
3. Left: Write documentation
4. Right: Code being documented

### Multi-file Editing
1. Open main file
2. `<leader>wv` for each related file
3. Or use tabs: `<leader>Tn` per major component
4. Switch contexts as needed

## Troubleshooting

### Split Navigation Not Working
- Check if you're in terminal mode (press `<C-t>` first)
- Ensure tmux navigation plugin is loaded
- Try `<C-w>h/j/k/l` as fallback

### Tab Not Creating
- Make sure you're in normal mode
- Use `:tabnew` as alternative to `<leader>Tn`
- Check for plugin conflicts

### Window Resizing Issues
- Use `:resize N` and `:vertical resize N` manually
- Check terminal size isn't limiting resize
- Try `<C-w>=` to reset to equal sizes

### Lost in Multiple Splits/Tabs
- `:tabonly` to close all tabs except current
- `<C-w>o` to close all splits except current
- Use `gt` repeatedly to find your tab