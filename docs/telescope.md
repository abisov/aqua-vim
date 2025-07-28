# Telescope Usage Guide

This guide covers how to use Telescope for file navigation, searching, and opening files in different ways.

## Quick Reference

### Basic Telescope Commands
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fr` - Recent files
- `<leader>fc` - Command history
- `<leader>fs` - Search history

### File Opening Options (Inside Telescope)
- `<Enter>` - Open in current window
- `<C-t>` - Open in new tab
- `<C-x>` - Open in horizontal split
- `<C-v>` - Open in vertical split
- `<C-q>` - Send to quickfix list

### Navigation Inside Telescope
- `<C-j>` / `<Down>` - Move down
- `<C-k>` / `<Up>` - Move up
- `<C-n>` - Next history item
- `<C-p>` - Previous history item
- `<Esc>` - Close telescope

## Detailed Usage

### Finding Files (`<leader>ff`)

**Basic Usage:**
1. Press `<leader>ff`
2. Start typing filename or path
3. Use `<C-j>/<C-k>` to navigate results
4. Press `<Enter>` to open

**Advanced Filtering:**
- Type partial filename: `con` finds `config.lua`
- Use path: `lua/plug` finds files in `lua/plugins/`
- Fuzzy matching: `luplug` finds `lua/plugins/`

**Opening Options:**
```
<Enter>    → Open in current window (replaces current file)
<C-t>      → Open in new tab
<C-x>      → Open in horizontal split (top/bottom)
<C-v>      → Open in vertical split (left/right)
```

### Live Grep (`<leader>fg`)

**Search in file contents:**
1. Press `<leader>fg`
2. Type search term (regex supported)
3. Results show filename:line:content
4. Use same opening shortcuts as above

**Search Examples:**
- `function` - Find all function definitions
- `TODO` - Find all TODO comments
- `export.*Component` - Find exported components (regex)

**Opening Search Results:**
- `<Enter>` - Jump to line in current window
- `<C-t>` - Open file in new tab, jump to line
- `<C-x>` - Open in horizontal split, jump to line
- `<C-v>` - Open in vertical split, jump to line

### Buffer Navigation (`<leader>fb`)

**Switch between open buffers:**
1. Press `<leader>fb`
2. See all open files/buffers
3. Use same opening shortcuts
4. Great for quick switching

## File Opening Workflows

### Current Window (Default)
```
1. <leader>ff
2. Type filename
3. <Enter>
```
**Result**: File opens in current window, replaces current file

### New Tab Workflow
```
1. <leader>ff
2. Type filename  
3. <C-t>
```
**Result**: New tab opens with selected file

### Split Screen Workflow

**Vertical Split (Side-by-side):**
```
1. <leader>ff
2. Type filename
3. <C-v>
```
**Result**: Screen splits vertically, file opens on right

**Horizontal Split (Top/bottom):**
```
1. <leader>ff
2. Type filename
3. <C-x>
```
**Result**: Screen splits horizontally, file opens on bottom

### Multiple File Opening
```
1. <leader>ff
2. Find first file, press <C-v> (opens in split)
3. <leader>ff again
4. Find second file, press <C-t> (opens in new tab)
5. Continue as needed
```

## Advanced Features

### Quickfix Integration
```
1. <leader>fg (live grep)
2. Search for something
3. <C-q> to send all results to quickfix
4. Use <leader>h/<leader>; to navigate quickfix items
```

### Search History
- `<leader>fs` - View previous searches
- `<C-n>/<C-p>` - Navigate through search history while in telescope

### Command History
- `<leader>fc` - See recent commands
- Useful for repeating complex operations

## Combining with Navigation

### Telescope + Splits
```
1. Start with main file
2. <leader>wv (split vertically)
3. In right split: <leader>ff → <Enter>
4. Now have two files side-by-side
```

### Telescope + Tabs
```
1. <leader>ff → <C-t> (opens file in new tab)
2. <leader>ff → <C-t> (opens another file in new tab)
3. Use gt/gT to switch between tabs
```

### Quick Compare Workflow
```
1. Open first file normally
2. <leader>ff → type second filename → <C-v>
3. Now comparing two files side-by-side
4. Use <C-h>/<C-l> to switch between them
```

## Search Tips

### File Finding Tips
- **Partial names**: Type `conf` to find `config.lua`
- **Extensions**: Type `.md` to find all markdown files
- **Paths**: Type `docs/` to search in docs directory
- **Mixed**: Type `docs conf` to find config files in docs

### Grep Search Tips
- **Case sensitive**: Search is case sensitive by default
- **Regex**: Use `function.*export` for complex patterns
- **Word boundaries**: Use `\bword\b` for exact word matches
- **File types**: Telescope automatically respects .gitignore

### Performance Tips
- **Large projects**: Telescope indexes files, first search may be slow
- **Hidden files**: Use `<leader>fg` with `--hidden` flag if needed
- **Git integration**: Only searches tracked files by default

## Integration Examples

### With Terminal Workflow
```
1. <leader>ftr (open terminal on right)
2. In left window: <leader>ff → find file
3. Edit in left, test in right terminal
4. <C-h>/<C-l> to switch between editing and terminal
```

### With Testing Workflow
```
1. <leader>ff → find implementation file
2. <leader>"f (run tests for current file)  
3. <leader>fg → search for "test" or "spec"
4. <C-v> to open test file in split
```

### Project Navigation Pattern
```
1. Main tab: Core files (<leader>ff for quick switching)
2. <leader>Tn: New tab for feature work
3. In feature tab: <leader>wv → <leader>ff → <C-v>
4. Side-by-side development in feature tab
```

## Troubleshooting

### Telescope Not Finding Files
- Check if file is in .gitignore (telescope respects it)
- Try `:Telescope find_files hidden=true` for hidden files
- Ensure you're in the right directory (telescope searches from pwd)

### Search Results Empty
- Check spelling and case sensitivity
- Try broader search terms first
- Use `:Telescope live_grep` for manual invocation

### Performance Issues
- Large repos may be slow on first search
- Consider using `:Telescope git_files` for git-only search
- Close unused buffers with `<leader>q` to improve buffer search

### Opening in Wrong Location
- `<C-t>` = new tab
- `<C-v>` = vertical split (left/right)
- `<C-x>` = horizontal split (top/bottom)
- `<Enter>` = current window (replaces current file)

Remember: Telescope is your primary file navigation tool. Master these shortcuts and you'll navigate your codebase much faster than traditional file explorers!