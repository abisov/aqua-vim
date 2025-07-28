# Terminal Usage Guide

This guide covers terminal functionality in this Neovim configuration using vim-floaterm.

## Quick Reference

**Terminal Management:**
- `<leader>ft` - Open floating terminal (center)
- `<leader>ftr` - Open terminal on right side  
- `<leader>tn` - Create new terminal
- `<leader>tk` - Kill current terminal
- `<leader>tt` - Toggle terminal

**Terminal Navigation:**
- `<leader>t[` - Previous terminal
- `<leader>t]` - Next terminal
- `<C-t>` - Exit terminal mode
- `<C-h/j/k/l>` - Navigate between windows

**Visual Indicator:**
- **󰆍 2/3** appears in statusline showing current/total terminals

## Terminal Types

### Floating Terminal (`<leader>ft`)
- Centered floating window
- 70% height, 80% width
- Auto-closes when process exits
- Good for quick commands

### Right-side Terminal (`<leader>ftr`)
- Vertical split on the right
- 30% width, full height
- Persistent workspace terminal
- Good for long-running processes

### Additional Terminals (`<leader>tn`)
- Opens as right-side vertical split (same as `<leader>ftr`)
- 30% width, full height
- Numbered automatically (floaterm1, floaterm2, etc.)

## Navigation & Mode Switching

### Exiting Terminal Mode
When in terminal mode (cursor in terminal), you need to exit to use leader shortcuts:
1. Press `<C-t>` to exit terminal mode
2. Now you can use leader shortcuts like `<leader>tn`, `<leader>t[`, etc.
3. To return to terminal: navigate to terminal window and press `i` or `a`

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to bottom window  
- `<C-k>` - Move to top window
- `<C-l>` - Move to right window

These work from both terminal and normal mode.

## Terminal Management

### Creating Terminals
```
<leader>ft   # Quick floating terminal
<leader>ftr  # Right-side terminal
<leader>tn   # New right-side terminal
```

### Switching Between Terminals
```
<leader>t[   # Previous terminal (works in normal and terminal mode)
<leader>t]   # Next terminal (works in normal and terminal mode)
<leader>tt   # Toggle current terminal visibility
```

### Closing Terminals
```
<leader>tk   # Kill current terminal
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

### Basic Development Workflow
1. Open your code files
2. Press `<leader>ftr` to open terminal on right
3. Run development server: `npm run dev`
4. Use `<C-h>` to switch back to code
5. Use `<C-l>` to check terminal output

### Multiple Terminal Workflow
1. Create first terminal: `<leader>ftr`
2. Start server: `npm run dev`
3. Create second terminal: `<leader>tn` 
4. Run tests: `npm test`
5. Switch between them: `<leader>t[` and `<leader>t]`
6. Monitor with statusline: **󰆍 1/2** → **󰆍 2/2**

### Quick Commands Workflow
1. Press `<leader>ft` for floating terminal
2. Run quick command: `git status`
3. Terminal auto-closes or press `<C-t>` then `<leader>tt`

## Auto Directory Change

The configuration automatically changes the working directory to match the current file's directory when you enter a buffer. This means:
- Terminals opened will start in the correct project directory
- No need to manually `cd` to the right location
- Works seamlessly with project-based workflows

## Key Differences from Other Mappings

**Terminal mappings** use lowercase `t`:
- `<leader>t*` - Terminal operations (e.g., `<leader>tn`, `<leader>tk`)

**Test mappings** use uppercase `T`:
- `<leader>T*` - Test operations (e.g., `<leader>T`, `<leader>Tf`)

**Navigation mappings** use different prefixes:
- `<leader>w*` - Window/split operations (e.g., `<leader>wv`, `<leader>wh`)
- `<leader>T*` - Tab operations (e.g., `<leader>Tn`, `<leader>Tc`)

This prevents conflicts between terminal, test, and navigation functionality.

## Tips & Tricks

### Persistent Terminals
- Terminals remain open even when hidden
- Use `<leader>tt` to toggle visibility without losing session
- Perfect for long-running processes like servers

### Terminal Switching Shortcuts
- `<leader>t[` and `<leader>t]` work from both normal and terminal mode
- No need to exit terminal mode first for navigation
- Quick switching without losing context

### Statusline Monitoring
- Always know how many terminals you have open
- See which terminal is currently active
- Helps prevent terminal proliferation

## Troubleshooting

### Can't Use Leader Shortcuts in Terminal
**Problem**: Leader shortcuts don't work when cursor is in terminal
**Solution**: Press `<C-t>` to exit terminal mode first

### Lost Track of Terminals
**Problem**: Don't know which terminals are open
**Solution**: Check statusline indicator **󰆍 2/3** or use `<leader>t[/]` to cycle

### Terminal Directory Wrong
**Problem**: Terminal opens in wrong directory
**Solution**: The auto-directory change should handle this. If not working, check the BufEnter autocmd in `lua/aqua/options.lua`

### Terminal Won't Close  
**Problem**: Terminal stays open after process exits
**Solution**: 
- Type `exit` in terminal
- Or use `<leader>tk` to force kill
- Floating terminals auto-close on success