# Terminal Usage Guide

This guide covers terminal functionality in this Neovim configuration using toggleterm.nvim.

## Quick Reference

**Tab-like Terminal Management:**
- `<leader>t1` - Terminal 1 (tab-like access)
- `<leader>t2` - Terminal 2 (tab-like access)
- `<leader>t3` - Terminal 3 (tab-like access)
- `<leader>t4` - Terminal 4 (tab-like access)

**Layout Options:**
- `<leader>tf` - Float terminal (centered overlay)
- `<leader>th` - Horizontal terminal (bottom split)
- `<leader>tv` - Vertical terminal (right split)
- `<leader>tt` - Toggle current terminal

**Specialized Terminals:**
- `<leader>lg` - LazyGit (dedicated floating terminal)
- `<leader>tr` - Node REPL (horizontal terminal)

**Terminal Navigation:**
- `<C-\>` - Quick toggle terminal
- `<Esc>` - Exit terminal mode (from terminal)
- `<C-h/j/k/l>` - Navigate between windows (works in terminal mode)

## Terminal Types

### Tab-like Terminals (`<leader>t1-4`)
- Direct access to numbered terminals 1-4
- Persistent across sessions
- Each terminal maintains its own state
- Perfect for dedicated workflows (server, tests, git, etc.)

### Floating Terminal (`<leader>tf`)
- Centered overlay window
- 90% height and width with curved border
- Good for quick commands and temporary tasks
- Doesn't interfere with current layout

### Horizontal Terminal (`<leader>th`)
- Bottom split terminal
- 15 lines height
- Good for monitoring output while coding
- Integrated into window layout

### Vertical Terminal (`<leader>tv`)
- Right-side split terminal
- 30% of screen width
- Good for long-running processes
- Side-by-side with code

### Specialized Terminals
- **LazyGit** (`<leader>lg`): Dedicated git interface in floating window
- **Node REPL** (`<leader>tr`): JavaScript/Node.js interactive shell

## Navigation & Mode Switching

### Exiting Terminal Mode
When in terminal mode (cursor in terminal):
1. Press `<Esc>` to exit terminal mode (improved from old `<C-t>`)
2. Now you can use leader shortcuts like `<leader>t1`, `<leader>t2`, etc.
3. To return to terminal: navigate to terminal window and it auto-enters insert mode

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to bottom window  
- `<C-k>` - Move to top window
- `<C-l>` - Move to right window
- `<C-w>` - Window command prefix (from terminal mode)

These work from both terminal and normal mode seamlessly.

### Quick Terminal Access
- `<C-\>` - Global terminal toggle (works from any mode)
- Terminals persist when hidden and restore previous state

## Terminal Management

### Creating/Accessing Terminals
```
<leader>t1   # Access Terminal 1 (creates if doesn't exist)
<leader>t2   # Access Terminal 2 (creates if doesn't exist)
<leader>t3   # Access Terminal 3 (creates if doesn't exist)
<leader>t4   # Access Terminal 4 (creates if doesn't exist)

<leader>tf   # Floating terminal
<leader>th   # Horizontal terminal
<leader>tv   # Vertical terminal
<leader>tn   # New/Toggle terminal
```

### Specialized Terminals
```
<leader>lg   # LazyGit terminal (floating)
<leader>tr   # Node REPL terminal
```

### Terminal Control
```
<leader>tt   # Toggle current terminal visibility
<leader>tk   # Kill current terminal
<C-\>        # Quick toggle (global shortcut)
exit         # Type in terminal to close normally
```

## Visual Indicators

### Statusline Indicator
The statusline shows **󰆍 2/3** when terminals are open:
- **󰆍** - Terminal icon
- **2** - Current terminal number
- **3** - Total number of terminals

The indicator:
- Only appears when terminals exist
- Updates automatically when switching terminals
- Uses blue color to match tokyonight theme

## Workflow Examples

### Tab-like Development Workflow
1. Open your code files
2. Press `<leader>t1` for Terminal 1 - development server
3. Run: `npm run dev`
4. Press `<leader>t2` for Terminal 2 - testing
5. Run: `npm test --watch`
6. Press `<leader>t3` for Terminal 3 - git operations
7. Use `<leader>lg` for visual git management
8. Switch instantly: `<leader>t1`, `<leader>t2`, `<leader>t3`

### Specialized Terminal Workflow
1. Code in main window
2. `<leader>lg` - Quick git status/commits with LazyGit
3. `<leader>tr` - Test JavaScript snippets in Node REPL
4. `<leader>t1` - Keep development server running
5. `<leader>tf` - Quick floating terminal for one-off commands

### Layout-based Workflow
1. `<leader>tv` - Vertical terminal for monitoring logs
2. `<leader>th` - Horizontal terminal for quick commands
3. `<leader>tf` - Floating terminal for git operations
4. Each layout serves different purposes

## Auto Directory Change

The configuration automatically changes the working directory to match the current file's directory when you enter a buffer. This means:
- Terminals opened will start in the correct project directory
- No need to manually `cd` to the right location
- Works seamlessly with project-based workflows

## Key Differences from Other Mappings

**Terminal mappings** use lowercase `t`:
- `<leader>t1-4` - Direct terminal access (tab-like)
- `<leader>t*` - Terminal operations (e.g., `<leader>tn`, `<leader>tk`)

**Test mappings** use uppercase `T`:
- `<leader>T*` - Test operations (e.g., `<leader>T`, `<leader>Tf`)

**Navigation mappings** use different prefixes:
- `<leader>w*` - Window/split operations (e.g., `<leader>wv`, `<leader>wh`)

**Specialized terminals** use descriptive keys:
- `<leader>lg` - LazyGit (git operations)
- `<leader>tr` - REPL (interactive shells)

This prevents conflicts and provides intuitive access patterns.

## Tips & Tricks

### Tab-like Terminal Management
- `<leader>t1-4` provides instant access to specific terminals
- Each terminal maintains its own working directory and history
- Perfect for dedicated workflows (server, tests, git, monitoring)

### Persistent Sessions
- Terminals remain open even when hidden
- Use `<leader>tt` or `<C-\>` to toggle visibility without losing session
- Perfect for long-running processes like development servers

### Enhanced Navigation
- `<Esc>` exits terminal mode (more intuitive than old `<C-t>`)
- Window navigation (`<C-h/j/k/l>`) works seamlessly from terminal mode
- Auto-insert mode when entering terminals

### Specialized Workflows
- LazyGit (`<leader>lg`) provides visual git interface
- Node REPL (`<leader>tr`) for quick JavaScript testing
- Different layouts for different use cases

## Troubleshooting

### Can't Use Leader Shortcuts in Terminal
**Problem**: Leader shortcuts don't work when cursor is in terminal
**Solution**: Press `<Esc>` to exit terminal mode first (improved from old `<C-t>`)

### Lost Track of Terminals
**Problem**: Don't know which terminals are open
**Solution**: Use `<leader>t1-4` to check specific terminals, or `<C-\>` to toggle current

### Terminal Directory Wrong
**Problem**: Terminal opens in wrong directory
**Solution**: The auto-directory change should handle this. If not working, check the BufEnter autocmd in `lua/aqua/options.lua`

### Terminal Won't Close  
**Problem**: Terminal stays open after process exits
**Solution**: 
- Type `exit` in terminal
- Or use `<leader>tk` to force kill current terminal
- Terminals persist by design for better workflow

### LazyGit Not Working
**Problem**: `<leader>lg` doesn't open LazyGit
**Solution**: Ensure `lazygit` is installed: `brew install lazygit` (macOS) or equivalent

### Node REPL Issues
**Problem**: `<leader>tr` doesn't work
**Solution**: Ensure Node.js is installed and `node` command is available in PATH