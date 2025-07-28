return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable = true,
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({"]c", bang = true})
          else
            gs.nav_hunk("next")
          end
        end, { desc = "Next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({"[c", bang = true})
          else
            gs.nav_hunk("prev")
          end
        end, { desc = "Previous git hunk" })

        -- Actions
        map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<leader>ghs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage selected hunk" })
        map("v", "<leader>ghr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset selected hunk" })
        map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage entire buffer" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset entire buffer" })
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame line (full)" })
        map("n", "<leader>ghB", function()
          gs.blame_line({ full = false })
        end, { desc = "Blame line (summary)" })
        map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
        map("n", "<leader>ghd", gs.diffthis, { desc = "Diff this" })
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, { desc = "Diff this (cached)" })
        map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle deleted lines" })
        map("n", "<leader>gts", gs.toggle_signs, { desc = "Toggle git signs" })
        map("n", "<leader>gtn", gs.toggle_numhl, { desc = "Toggle number highlight" })
        map("n", "<leader>gtl", gs.toggle_linehl, { desc = "Toggle line highlight" })
        map("n", "<leader>gtw", gs.toggle_word_diff, { desc = "Toggle word diff" })

        -- Diff exit helper
        map("n", "<leader>gq", function()
          vim.cmd("diffoff!")
          pcall(vim.cmd, "q")
          pcall(vim.cmd, "q")
        end, { desc = "Exit diff cleanly" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })
      end,
    })
  end,
}