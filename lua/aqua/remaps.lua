-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Jump between markdown headers
vim.keymap.set("n", "gj", [[/^##\+ .*<CR>]], { buffer = true, silent = true })
vim.keymap.set("n", "gk", [[?^##\+ .*<CR>]], { buffer = true, silent = true })

-- Exit insert mode without hitting Esc
vim.keymap.set("i", "jj", "<Esc><Esc>", { desc = "Esc" })

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G")

-- Keep window centered when going up/down
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Copy text to " register
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank into \" register" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank into \" register" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank into \" register" })

-- Delete text to " register
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete into \" register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete into \" register" })

-- Get out Q
vim.keymap.set("n", "Q", "<nop>")

-- close buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Close buffer without closing split
vim.keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
vim.keymap.set("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "<leader>;", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- Jump to plugin management file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/plugins.lua<CR>", { desc = "Jump to configuration file" })

-- Run Tests (using <leader>" as entry point)
vim.keymap.set("n", '<leader>"', "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
vim.keymap.set("n", '<leader>"f', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { desc = "Run Test File" })
vim.keymap.set("n", '<leader>"d', "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  { desc = "Run Test Directory" })
vim.keymap.set("n", '<leader>"p', "<cmd>lua require('neotest').output_panel.toggle()<CR>",
  { desc = "Toggle Test Output Panel" })
vim.keymap.set("n", '<leader>"l', "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
vim.keymap.set("n", '<leader>"s', "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })

-- Debug Tests
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Debug Continue" })
vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
vim.keymap.set("n", "<leader>dsu", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dst", "<cmd>DapStepTerminate<CR>", { desc = "Stop Debugger" })
-- Breakpoint management (nested under <leader>db*)
vim.keymap.set("n", "<leader>dbb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dbc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dbe", "<cmd>lua require'dap'.set_exception_breakpoints()<CR>",
  { desc = "Exception Breakpoint" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>",
  { desc = "Show Breakpoints" })
vim.keymap.set("n", "<leader>dr",
  "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>",
  { desc = "Show DAP REPL" })
vim.keymap.set("n", "<leader>ds",
  "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Scopes" })
vim.keymap.set("n", "<leader>df",
  "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>",
  { desc = "Show DAP Stacks" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debug Last Test" })

-- Copy file paths
vim.keymap.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- Open Zoxide telescope extension
vim.keymap.set("n", "<leader>Z", "<cmd>Zi<CR>", { desc = "Open Zoxide" })

-- Toggle minimap/scrollbar
vim.keymap.set("n", "<leader>mm", function()
  local scrollbar = require('scrollbar')
  if vim.g.scrollbar_enabled ~= false then
    vim.g.scrollbar_enabled = false
    scrollbar.clear()
    vim.notify("Scrollbar disabled")
  else
    vim.g.scrollbar_enabled = true
    scrollbar.render()
    vim.notify("Scrollbar enabled")
  end
end, { desc = "Toggle Minimap" })

-- Resize with arrows
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Window/Split management (using <leader>w prefix to avoid conflicts)
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Split Horizontally" })
vim.keymap.set("n", "<leader>wt", "<cmd>tab split<CR>", { desc = "Send Buffer to New Tab" })
vim.keymap.set("n", "<leader>wT", "<C-w>T", { desc = "Move Split to New Tab" })

-- Buffer navigation (for lualine tabline)
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bdelete|edit#|bdelete#<CR>", { desc = "Close Other Buffers" })

-- Quick buffer switching
-- Note: gb/gB removed to avoid conflict with built-in gb (repeat substitute)
-- Use Cmd/Alt+numbers or leader+bn/bp instead

-- Cross-platform buffer navigation by number
-- Cmd+number on Mac, Alt+number on other platforms
local modifier = vim.fn.has('mac') == 1 and '<D-' or '<A-'

-- Function to get the nth listed buffer
local function goto_buffer_by_index(index)
  local buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())
  
  if buffers[index] then
    vim.api.nvim_set_current_buf(buffers[index])
  else
    vim.notify("Buffer " .. index .. " doesn't exist", vim.log.levels.WARN)
  end
end

for i = 1, 9 do
  vim.keymap.set("n", modifier .. i .. ">", function() goto_buffer_by_index(i) end, 
    { desc = "Buffer " .. i })
end

-- Cross-platform sequential buffer navigation
vim.keymap.set("n", modifier .. "b>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", modifier .. "B>", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

-- Smart buffer close with save prompt
local function close_buffer_with_prompt()
  if vim.bo.modified then
    local choice = vim.fn.confirm("Save changes to " .. vim.fn.expand("%:t") .. "?", "&Yes\n&No\n&Cancel", 1)
    if choice == 1 then -- Yes
      vim.cmd("write")
      vim.cmd("bdelete")
    elseif choice == 2 then -- No
      vim.cmd("bdelete!")
    end
    -- Cancel does nothing
  else
    vim.cmd("bdelete")
  end
end

vim.keymap.set("n", modifier .. "x>", close_buffer_with_prompt, { desc = "Close Buffer (with save prompt)" })

-- Toggle diff view for unsaved buffer changes
local function toggle_buffer_diff()
  local filename = vim.fn.expand("%")
  if filename == "" then
    vim.notify("No file to show diff for", vim.log.levels.WARN)
    return
  end
  
  -- Check if we have a fugitive buffer open (our diff)
  local has_fugitive = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)
    if bufname:match("fugitive://") then
      has_fugitive = true
      break
    end
  end
  
  if has_fugitive then
    -- Close our fugitive diff
    vim.cmd("diffoff!")
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local bufname = vim.api.nvim_buf_get_name(buf)
      if bufname:match("fugitive://") then
        vim.api.nvim_win_close(win, false)
      end
    end
  else
    -- Check if current buffer has unsaved changes
    if not vim.bo.modified then
      vim.notify("No unsaved changes in current buffer", vim.log.levels.INFO)
      return
    end
    
    -- Open vertical diff split showing buffer vs HEAD
    vim.cmd("Gvdiffsplit HEAD")
  end
end

vim.keymap.set("n", modifier .. "d>", toggle_buffer_diff, { desc = "Toggle Buffer Diff (Unsaved Changes)" })




-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", { desc = "Jump to beginning of line" })
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Move block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
vim.keymap.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- Exit terminal mode shortcut
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>")

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Auto enter insert mode when opening a terminal",
  group = "custom_buffer",
  pattern = "*",
  callback = function()
    -- Wait briefly just in case we immediately switch out of the buffer (e.g. Neotest)
    vim.defer_fn(function()
      if vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
        vim.cmd([[startinsert]])
      end
    end, 100)
  end,
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = "custom_buffer",
  pattern  = "*",
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})
