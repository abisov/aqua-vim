# Mapping Summary

Quick reference for all leader key mappings organized by functionality.

## Terminal Operations (`<leader>t*` - lowercase t)
- `<leader>ft` - Open floating terminal
- `<leader>ftr` - Open terminal on right
- `<leader>tn` - New terminal
- `<leader>tk` - Kill terminal
- `<leader>tt` - Toggle terminal
- `<leader>t[` - Previous terminal
- `<leader>t]` - Next terminal

## Test Operations (`<leader>T*` - uppercase T)
- `<leader>T` - Run current test
- `<leader>Tf` - Run test file
- `<leader>Td` - Run test directory
- `<leader>Tp` - Toggle test output panel
- `<leader>Tl` - Run last test
- `<leader>Ts` - Toggle test summary

## Window/Split Operations (`<leader>w*`)
- `<leader>wv` - Split vertically
- `<leader>wh` - Split horizontally
- `<leader>wt` - Send buffer to new tab
- `<leader>wT` - Move split to new tab

## Tab Operations (`<leader>T*` - uppercase T, different letters)
- `<leader>Tn` - New tab
- `<leader>Tc` - Close tab
- `<leader>To` - Close other tabs
- `<leader>Tm` - Move tab to end
- `<leader>TM` - Move tab to beginning

## Buffer Operations
- `<leader>q` - Close buffer
- `<leader>w` - Close buffer, keep split (note: single `w`, not `w*`)
- `<leader>fb` - Find buffers

## File Operations
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `-` - Open Oil file manager

## Other Operations
- `<leader>s` - Replace word under cursor
- `<leader>l` - Format file
- `<leader>ll` - Lint file

## Navigation (no leader key)
- `<C-h/j/k/l>` - Move between windows
- `gt` / `gT` - Next/previous tab
- `<C-t>` - Exit terminal mode

## Key Principles

1. **No Conflicts**: Each prefix serves a specific purpose
2. **Logical Grouping**: Related operations share prefixes
3. **Case Sensitivity**: Uppercase vs lowercase creates separate namespaces
4. **Consistency**: Similar operations use similar patterns

## Recent Changes

**Navigation mappings were updated to avoid conflicts:**
- Split operations moved from `<leader>s*` to `<leader>w*`
- Tab operations use `<leader>T*` with specific letters
- This preserves `<leader>s` for "replace word under cursor"
- Eliminates "unnamed top level mapping paths" in which-key