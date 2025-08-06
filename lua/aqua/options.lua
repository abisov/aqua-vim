vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Fat block cursor everywhere except insert mode (thin line in insert)
vim.opt.guicursor = {
  "n-v-c:block",           -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",         -- Insert, command-line insert, visual-exclude: thin vertical line
  "r-cr:block",            -- Replace, command-line replace: block cursor
  "o:block",               -- Operator-pending: block cursor
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blink settings
}

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Use terminal colors for better theme matching
-- Set to false to use terminal's 16-color palette
-- Set to true for 24-bit colors (if terminal supports it)
vim.opt.termguicolors = true

vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.conceallevel = 2

-- Make yank/copy operations go to system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "silent! checktime"
})
-- Auto change directory to file's directory (disabled - causes issues with root-relative commands)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     local bufname = vim.api.nvim_buf_get_name(0)
--     if bufname ~= "" and vim.fn.isdirectory(vim.fn.expand("%:p:h")) == 1 then
--       vim.cmd("cd " .. vim.fn.expand("%:p:h"))
--     end
--   end,
-- })
-- Enable .nvimrc for local dir configuration
vim.opt.exrc = true
vim.opt.secure = true
