local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})

require('aqua.globals')
require('aqua.remaps')
require('aqua.options')

-- Auto-detect system theme and set appropriate colorscheme
local function set_theme_based_on_system()
  local is_dark = true -- Default to dark theme
  local is_light = false -- Track if explicitly set to light
  
  -- Detect OS and use appropriate method
  local uname = vim.loop.os_uname()
  if uname.sysname == "Darwin" then
    -- macOS
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    if result:match("Dark") then
      is_dark = true
    elseif result and result:len() > 0 then
      -- If we get a result but it's not "Dark", it's likely light mode
      is_light = true
      is_dark = false
    end
  else
    -- Linux - try multiple methods
    -- Method 1: Check GNOME color scheme preference (most reliable)
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result and result:match("prefer%-dark") then
        is_dark = true
      elseif result and result:match("prefer%-light") then
        is_light = true
        is_dark = false
      end
    end
    
    -- Method 1b: Check GNOME/GTK theme as fallback
    if not is_light then
      local handle2 = io.popen("gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null")
      if handle2 then
        local result2 = handle2:read("*a")
        handle2:close()
        if result2 and (result2:lower():match("dark") or result2:lower():match("adwaita%-dark")) then
          is_dark = true
        elseif result2 and result2:lower():match("light") then
          is_light = true
          is_dark = false
        end
      end
    end
    
    -- Method 2: Check KDE theme if GNOME method didn't work
    if not is_light then
      local handle3 = io.popen("kreadconfig5 --group General --key ColorScheme 2>/dev/null")
      if handle3 then
        local result3 = handle3:read("*a")
        handle3:close()
        if result3 and result3:lower():match("dark") then
          is_dark = true
        elseif result3 and result3:lower():match("light") then
          is_light = true
          is_dark = false
        end
      end
    end
    
    -- Method 3: Check environment variables
    if not is_light then
      local theme_env = os.getenv("GTK_THEME") or ""
      if theme_env:lower():match("dark") then
        is_dark = true
      elseif theme_env:lower():match("light") then
        is_light = true
        is_dark = false
      end
    end
  end
  
  if is_dark then
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox")
  else
    vim.o.background = "light"
    vim.cmd("colorscheme gruvbox")
  end
end

-- Set initial theme
set_theme_based_on_system()

-- Custom highlight overrides for better terminal integration
vim.cmd('hi IlluminatedWordText guibg=none gui=underline')
vim.cmd('hi IlluminatedWordRead guibg=none gui=underline')
vim.cmd('hi IlluminatedWordWrite guibg=none gui=underline')
require('nvim-highlight-colors').setup({
  enable_named_colors = false,
})

-- Add custom commands for keymap conflict detection
vim.api.nvim_create_user_command('CheckConflicts', function()
  local conflicts = {}
  local keymaps = vim.api.nvim_get_keymap('n')
  local seen = {}
  
  for _, keymap in ipairs(keymaps) do
    local key = keymap.lhs
    if seen[key] then
      table.insert(conflicts, {
        key = key,
        existing = seen[key],
        new = keymap
      })
    else
      seen[key] = keymap
    end
  end
  
  if #conflicts > 0 then
    print("Keymap conflicts found:")
    for _, conflict in ipairs(conflicts) do
      print("  " .. conflict.key .. " -> Multiple mappings")
    end
  else
    print("No keymap conflicts found!")
  end
end, { desc = "Check for keymap conflicts" })

vim.api.nvim_create_user_command('ShowLeaderMaps', function()
  local keymaps = vim.api.nvim_get_keymap('n')
  local leader_maps = {}
  
  for _, keymap in ipairs(keymaps) do
    if keymap.lhs:match('^' .. vim.g.mapleader) then
      table.insert(leader_maps, {
        key = keymap.lhs,
        desc = keymap.desc or keymap.rhs or "No description"
      })
    end
  end
  
  table.sort(leader_maps, function(a, b) return a.key < b.key end)
  
  print("Leader mappings:")
  for _, map in ipairs(leader_maps) do
    print("  " .. map.key .. " -> " .. map.desc)
  end
end, { desc = "Show all leader key mappings" })

-- Toggle between terminal colors and true colors
vim.api.nvim_create_user_command('ToggleTerminalColors', function()
  if vim.opt.termguicolors:get() then
    vim.opt.termguicolors = false
    print("Switched to terminal colors (16-color palette)")
  else
    vim.opt.termguicolors = true
    print("Switched to true colors (24-bit)")
  end
  -- Refresh colorscheme
  set_theme_based_on_system()
end, { desc = "Toggle between terminal colors and true colors" })

-- Command to manually refresh theme based on system
vim.api.nvim_create_user_command('RefreshTheme', function()
  set_theme_based_on_system()
  print("Theme refreshed based on system appearance")
end, { desc = "Refresh theme based on system appearance" })
