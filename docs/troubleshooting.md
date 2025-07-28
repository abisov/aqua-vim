# Troubleshooting Guide

This guide covers common issues you might encounter with this Neovim configuration and how to resolve them.

## Table of Contents

- [Installation Issues](#installation-issues)
- [Plugin Issues](#plugin-issues)
- [LSP Issues](#lsp-issues)
- [Performance Issues](#performance-issues)
- [Keybinding Conflicts](#keybinding-conflicts)
- [Language-Specific Issues](#language-specific-issues)
- [Git Integration Issues](#git-integration-issues)
- [Testing Issues](#testing-issues)
- [General Debugging](#general-debugging)

## Installation Issues

### Plugins not installing
**Symptoms**: Lazy.nvim shows errors or plugins don't install

**Solutions**:
1. Check internet connection
2. Clear lazy.nvim cache:
   ```bash
   rm -rf ~/.local/share/nvim/lazy
   ```
3. Restart Neovim and run `:Lazy sync`
4. Check for Neovim version compatibility (requires 0.9+)

### Missing dependencies
**Symptoms**: Error messages about missing binaries or libraries

**Solutions**:
1. Install required system dependencies:
   ```bash
   # For better search and file finding
   brew install ripgrep fd
   
   # For image support
   brew install imagemagick
   
   # Language-specific tools
   npm install -g eslint_d prettier
   ```

2. Use Mason to install missing tools:
   ```vim
   :Mason
   ```

### Configuration not loading
**Symptoms**: Default Neovim behavior, no custom configurations

**Solutions**:
1. Check file path: Configuration should be in `~/.config/nvim/`
2. Check init.lua syntax:
   ```vim
   :lua vim.cmd('source ~/.config/nvim/init.lua')
   ```
3. Look for error messages on startup

## Plugin Issues

### Lazy.nvim errors
**Symptoms**: Plugin loading errors or crashes

**Solutions**:
1. Update plugins:
   ```vim
   :Lazy update
   ```
2. Clean and reinstall:
   ```vim
   :Lazy clean
   :Lazy sync
   ```
3. Check specific plugin logs:
   ```vim
   :Lazy log
   ```

### Oil file manager not working
**Symptoms**: `-` key doesn't open file browser or crashes

**Solutions**:
1. Check if oil.nvim is installed: `:Lazy`
2. Try manual command: `:Oil`
3. Check for conflicting keybindings
4. Restart Neovim

### Telescope issues
**Symptoms**: Fuzzy finder not working or showing errors

**Solutions**:
1. Install telescope-fzf-native:
   ```vim
   :Lazy build telescope-fzf-native.nvim
   ```
2. Check ripgrep installation: `which rg`
3. Clear telescope cache: `:Telescope builtin`
4. For live grep issues, ensure ripgrep is in PATH

## LSP Issues

### LSP server not starting
**Symptoms**: No completions, diagnostics, or hover information

**Solutions**:
1. Check if LSP server is installed:
   ```vim
   :Mason
   ```
2. Check LSP status:
   ```vim
   :LspInfo
   ```
3. Restart LSP:
   ```vim
   :LspRestart
   ```
4. Check Mason installation path:
   ```vim
   :echo stdpath('data') .. '/mason/bin'
   ```

### Completions not working
**Symptoms**: No autocomplete suggestions

**Solutions**:
1. Check if nvim-cmp is running: `:lua print(require('cmp').get_config())`
2. Verify LSP is attached: `:LspInfo`
3. Check completion sources: `:CmpStatus`
4. Restart Neovim

### Formatting not working
**Symptoms**: `<leader>l` doesn't format code

**Solutions**:
1. Check if formatter is installed: `:Mason`
2. Verify conform.nvim setup: `:ConformInfo`
3. Try manual formatting: `:lua require('conform').format()`
4. Check filetype: `:set filetype?`

### Linting not working
**Symptoms**: No linting errors shown

**Solutions**:
1. Check if linter is installed: `:Mason`
2. Verify nvim-lint setup: `:lua print(vim.inspect(require('lint').linters_by_ft))`
3. Manually trigger linting: `<leader>ll`
4. Check linter executable: `:!which eslint_d` (for example)

## Performance Issues

### Slow startup
**Symptoms**: Neovim takes long time to start

**Solutions**:
1. Profile startup time:
   ```bash
   nvim --startuptime startup.log
   # Check the log for slow plugins
   ```
2. Use lazy loading for more plugins
3. Disable unused plugins temporarily
4. Check for plugin conflicts

### Laggy typing or editing
**Symptoms**: Noticeable delay when typing

**Solutions**:
1. Disable syntax highlighting temporarily: `:syntax off`
2. Check Treesitter: `:TSBufDisable highlight`
3. Reduce updatetime: `:set updatetime=1000`
4. Profile with: `:profile start /tmp/profile.log | :profile func * | :profile file *`

### High memory usage
**Symptoms**: Neovim using excessive RAM

**Solutions**:
1. Close unused buffers: `:bufdo bd`
2. Check for memory leaks in plugins
3. Restart Neovim periodically
4. Disable file watchers if not needed

## Keybinding Conflicts

### Key doesn't work as expected
**Symptoms**: Keybinding does something different or nothing

**Solutions**:
1. Check which-key popup: Press `<leader>` and wait
2. Check all mappings for a key:
   ```vim
   :map <leader>ff
   :nmap <leader>ff
   :imap <C-h>
   ```
3. Use verbose mapping to see where it's defined:
   ```vim
   :verbose nmap <leader>ff
   ```

### Leader key not working
**Symptoms**: Leader combinations don't work

**Solutions**:
1. Check leader key setting: `:echo g:mapleader`
2. Ensure leader is set before plugin loading
3. Try different leader key temporarily
4. Check for terminal key mapping conflicts

## Language-Specific Issues

### JavaScript/TypeScript
**Common issues**:
- ESLint not finding config file
- Prettier formatting conflicts
- Import resolution issues

**Solutions**:
1. Ensure project has eslint config (`.eslintrc.js`, etc.)
2. Install project dependencies: `npm install`
3. Check Node.js version compatibility
4. Verify TypeScript server: `:LspInfo`

### Go
**Common issues**:
- Gopls not working
- Import organization not working
- Debug setup issues

**Solutions**:
1. Install Go tools: `go install golang.org/x/tools/gopls@latest`
2. Check GOPATH and GOROOT: `:echo $GOPATH`
3. Update Go version if needed
4. Install Delve for debugging: `go install github.com/go-delve/delve/cmd/dlv@latest`

### Python
**Common issues**:
- Virtual environment not detected
- Pylsp not working

**Solutions**:
1. Activate virtual environment before starting Neovim
2. Install language server: `pip install python-lsp-server`
3. Check Python path: `:echo exepath('python')`

### Java/Kotlin
**Common issues**:
- JDTLS not starting
- Gradle/Maven integration issues

**Solutions**:
1. Ensure Java 11+ is installed: `java -version`
2. Set JAVA_HOME environment variable
3. Install Mason Java tools: `:Mason`
4. Check project structure (look for `build.gradle` or `pom.xml`)

## Git Integration Issues

### Fugitive not working
**Symptoms**: `:Git` command fails or shows errors

**Solutions**:
1. Ensure Git is installed and in PATH: `which git`
2. Check if current directory is a Git repository: `git status`
3. Verify Git configuration: `git config --list`

### Gitsigns not showing
**Symptoms**: No git symbols in sign column

**Solutions**:
1. Check if in Git repository: `:lua print(vim.fn.system('git rev-parse --git-dir'))`
2. Verify signcolumn is enabled: `:set signcolumn?`
3. Check Gitsigns status: `:Gitsigns debug_messages`
4. Refresh Gitsigns: `:Gitsigns refresh`

## Testing Issues

### Neotest not finding tests
**Symptoms**: No tests detected or run

**Solutions**:
1. Check if in correct directory with test files
2. Verify test adapter for your language is installed
3. Check test file naming conventions (e.g., `*.test.js`, `*_spec.rb`)
4. Manually run tests to ensure they work: `npm test` or `bundle exec rspec`

### Debug adapter not working
**Symptoms**: Debugging doesn't start or crashes

**Solutions**:
1. Install debug adapter through Mason: `:Mason`
2. Check DAP configuration: `:lua print(vim.inspect(require('dap').configurations))`
3. Verify debugger is installed (e.g., `node-debug2`, `delve`)
4. Check debug adapter logs

## General Debugging

### Getting more information
**Useful commands**:
```vim
" Check health of Neovim installation
:checkhealth

" View all loaded plugins
:Lazy

" Check LSP status
:LspInfo

" View Mason installations
:Mason

" Check which plugins are loaded
:lua print(vim.inspect(vim.tbl_keys(package.loaded)))

" View current settings
:set all

" Check for errors
:messages
```

### Log files locations
- Neovim: `~/.local/state/nvim/log`
- LSP: `~/.local/state/nvim/lsp.log`
- Mason: `~/.local/share/nvim/mason.log`

### Getting help
1. Check plugin documentation: `:help plugin-name`
2. Look at plugin GitHub repositories for issues
3. Check Neovim documentation: `:help`
4. Use `:checkhealth` for diagnostic information

### Reset configuration
If all else fails, you can reset the configuration:

1. **Backup current config**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clean data directories**:
   ```bash
   rm -rf ~/.local/share/nvim
   rm -rf ~/.local/state/nvim
   ```

3. **Restore from backup and start fresh**:
   ```bash
   cp -r ~/.config/nvim.backup ~/.config/nvim
   nvim  # Let lazy.nvim reinstall everything
   ```

### Performance profiling
For detailed performance analysis:

```vim
" Start profiling
:profile start /tmp/nvim-profile.log
:profile func *
:profile file *

" Use Neovim normally, then stop profiling
:profile stop

" Check the log file
:edit /tmp/nvim-profile.log
```

---

If you encounter an issue not covered here, check:
1. The plugin's GitHub repository for known issues
2. Neovim's GitHub discussions
3. The `:checkhealth` output for diagnostic information