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
vim.cmd("colorscheme tokyonight")
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
