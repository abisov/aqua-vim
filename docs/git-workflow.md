# Git Workflow with Gitsigns and Diffview

This guide covers how to effectively use gitsigns and diffview for git operations in Neovim.

## Gitsigns: Real-time Git Integration

Gitsigns provides real-time git status in the sign column and powerful hunk management capabilities.

### Visual Indicators

- `┃` - Added lines
- `┃` - Modified lines  
- `_` - Deleted lines
- `‾` - Top deleted lines
- `~` - Changed/deleted lines
- `┆` - Untracked lines

### Basic Hunk Navigation

Navigate between git hunks (changes) in your file:

```
]c  - Jump to next hunk
[c  - Jump to previous hunk
```

### Hunk Management

Stage and manage individual hunks without leaving your editor:

```
<leader>ghs  - Stage current hunk
<leader>ghr  - Reset current hunk (discard changes)
<leader>ghp  - Preview hunk in floating window
<leader>ghu  - Undo stage hunk
```

**Visual mode selections:**
```
<leader>ghs  - Stage selected lines
<leader>ghr  - Reset selected lines
```

### Buffer-level Operations

Work with entire files:

```
<leader>ghS  - Stage entire buffer
<leader>ghR  - Reset entire buffer (discard all changes)
```

### Blame Integration

See who changed what and when:

```
<leader>ghb  - Show full blame for current line
<leader>ghB  - Show summary blame for current line
<leader>gtb  - Toggle persistent line blame display
```

### Diff Operations

Compare your changes:

```
<leader>ghd  - Diff current file against index
<leader>ghD  - Diff current file against HEAD
<leader>gq   - Exit diff cleanly (diffoff + close splits)
```

**Proper way to exit gitsigns diff:**
- Use `<leader>gq` for clean exit (recommended)
- Or manually: `:diffoff` then `:q` 
- Avoid force-closing with multiple `:q :q` as it can break gitsigns

### Visual Toggles

Customize what git information is displayed:

```
<leader>gts  - Toggle git signs in sign column
<leader>gtn  - Toggle line number highlighting
<leader>gtl  - Toggle line highlighting
<leader>gtw  - Toggle word-level diff highlighting
<leader>gtd  - Toggle display of deleted lines
```

### Text Objects

Select hunks as text objects:

```
ih  - Select current hunk (works in visual and operator modes)
```

Example usage:
- `vih` - Visually select hunk
- `dih` - Delete hunk
- `yIh` - Yank hunk

## Diffview: Advanced Diff Visualization

Diffview provides a comprehensive interface for viewing diffs and managing git history.

### Opening Diffview

```
<leader>gdo  - Open diffview (working tree vs index)
<leader>gdh  - Open file history view
<leader>gdc  - Close diffview
<leader>gdr  - Refresh diffview
<leader>gdt  - Toggle file panel
```

### File Panel Navigation

When diffview is open, use these keys in the file panel:

```
j/k or ↓/↑    - Move between files
<CR> or o     - Open diff for selected file
-             - Stage/unstage selected file
S             - Stage all files
U             - Unstage all files
X             - Restore file to left side state
R             - Refresh file list
```

### Diff View Navigation

In the diff view:

```
<Tab>       - Next file
<S-Tab>     - Previous file
gf          - Open file in previous tab
<C-w><C-f>  - Open file in new split
<C-w>gf     - Open file in new tab
<leader>e   - Focus file panel
<leader>b   - Toggle file panel
g<C-x>      - Cycle through layouts
```

### Merge Conflict Resolution

When resolving conflicts, diffview provides powerful tools:

```
<leader>co  - Choose "ours" version
<leader>ct  - Choose "theirs" version  
<leader>cb  - Choose "base" version
<leader>ca  - Choose all versions
dx          - Delete conflict region

<leader>cO  - Choose "ours" for entire file
<leader>cT  - Choose "theirs" for entire file
<leader>cB  - Choose "base" for entire file
<leader>cA  - Choose all for entire file
dX          - Delete conflict region for entire file
```

### File History Features

In file history view:

```
y           - Copy commit hash
L           - Show commit details
<C-A-d>     - Open entry in diffview
g!          - Open options panel
```

### Folding in File Panel

```
zo/h        - Open/close fold
za          - Toggle fold
zR          - Open all folds
zM          - Close all folds
```

## Common Workflows

### 1. Review Changes Before Commit

```bash
# 1. See what files have changes
:Gitsigns toggle_signs  # Ensure signs are visible

# 2. Navigate through hunks
]c  # Jump to next change
<leader>ghp  # Preview the change

# 3. Stage good changes
<leader>ghs  # Stage this hunk

# 4. Get overview of all changes
<leader>gdo  # Open diffview
```

### 2. Selective Staging

```bash
# 1. Open diffview
<leader>gdo

# 2. In file panel, review each file
<CR>  # Open diff for file

# 3. Stage specific files
-  # Toggle staging for current file

# 4. Or stage individual hunks in editor
<leader>ghs  # Stage current hunk
```

### 3. Resolving Merge Conflicts

```bash
# 1. Open diffview during merge
<leader>gdo

# 2. Navigate to conflicted files
j/k  # Move through file list

# 3. Choose conflict resolutions
<leader>co  # Take "ours"
<leader>ct  # Take "theirs"
<leader>cb  # Take "base"

# 4. For complex conflicts, edit manually then stage
<leader>ghs  # Stage resolved hunk
```

### 4. Exploring File History

```bash
# 1. Open file history
<leader>gdh

# 2. Browse commits
j/k  # Navigate commits

# 3. See what changed
<CR>  # Open diff for commit

# 4. Copy commit hash if needed
y  # Copy hash to clipboard
```

### 5. Interactive Rebase Preparation

```bash
# 1. Review commit history
<leader>gdh

# 2. Identify commits to squash/reorder
L  # Show commit details

# 3. Copy commit hashes for rebase
y  # Copy hash

# 4. Exit and run interactive rebase
:q
# Then in terminal: git rebase -i <commit-hash>
```

### 6. Code Review Workflow

```bash
# 1. Open diffview to see all changes
<leader>gdo

# 2. Review each file systematically
<Tab>/<S-Tab>  # Navigate between files

# 3. Leave comments by staging/unstaging
-  # Mark file as "reviewed" by staging

# 4. Use blame for context
<leader>ghb  # See who wrote this code

# 5. Check file history for context
<leader>gdh  # Understand evolution of the file
```

## Tips and Best Practices

### Performance
- Gitsigns automatically disables for large files (>40,000 lines)
- Use `<leader>gts` to toggle signs if performance is slow
- Diffview works best with git repositories with reasonable history size

### Customization
- All keybindings can be modified in the plugin configuration files
- Gitsigns signs can be customized (currently using line characters)
- Diffview layouts can be cycled with `g<C-x>`

### Integration with Other Tools
- Works seamlessly with vim-fugitive (`:Git`)
- Complements lazygit (`<leader>lg`)
- Integrates with telescope for git picking
- Works with nvim-dap for debugging git-related issues

### Troubleshooting
- If signs don't appear, check `:Gitsigns debug_messages`
- For diffview issues, try `:DiffviewRefresh`
- Ensure you're in a git repository
- Check that git is available in your PATH