return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = true,
      git_cmd = { "git" },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          winbar_info = false,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = false,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
          win_opts = {}
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
          win_opts = {}
        },
      },
      commit_log_panel = {
        win_config = {
          win_opts = {},
        }
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_defaults = false,
        view = {
          { "n", "<tab>",       function() require("diffview.actions").select_next_entry() end,          { desc = "Open the diff for the next file" } },
          { "n", "<s-tab>",     function() require("diffview.actions").select_prev_entry() end,          { desc = "Open the diff for the previous file" } },
          { "n", "gf",          function() require("diffview.actions").goto_file() end,                  { desc = "Open the file in the previous tabpage" } },
          { "n", "<C-w><C-f>",  function() require("diffview.actions").goto_file_split() end,            { desc = "Open the file in a new split" } },
          { "n", "<C-w>gf",     function() require("diffview.actions").goto_file_tab() end,              { desc = "Open the file in a new tabpage" } },
          { "n", "<leader>e",   function() require("diffview.actions").focus_files() end,                { desc = "Bring focus to the file panel" } },
          { "n", "<leader>b",   function() require("diffview.actions").toggle_files() end,               { desc = "Toggle the file panel" } },
          { "n", "<leader>co",  function() require("diffview.actions").conflict_choose("ours") end,      { desc = "Choose the OURS version of a conflict" } },
          { "n", "<leader>ct",  function() require("diffview.actions").conflict_choose("theirs") end,    { desc = "Choose the THEIRS version of a conflict" } },
          { "n", "<leader>cb",  function() require("diffview.actions").conflict_choose("base") end,      { desc = "Choose the BASE version of a conflict" } },
          { "n", "<leader>ca",  function() require("diffview.actions").conflict_choose("all") end,       { desc = "Choose all the versions of a conflict" } },
          { "n", "dx",          function() require("diffview.actions").conflict_choose("none") end,      { desc = "Delete the conflict region" } },
        },
        file_panel = {
          { "n", "j",             function() require("diffview.actions").next_entry() end,           { desc = "Bring the cursor to the next file entry" } },
          { "n", "<down>",        function() require("diffview.actions").next_entry() end,           { desc = "Bring the cursor to the next file entry" } },
          { "n", "k",             function() require("diffview.actions").prev_entry() end,           { desc = "Bring the cursor to the previous file entry" } },
          { "n", "<up>",          function() require("diffview.actions").prev_entry() end,           { desc = "Bring the cursor to the previous file entry" } },
          { "n", "<cr>",          function() require("diffview.actions").select_entry() end,         { desc = "Open the diff for the selected entry" } },
          { "n", "o",             function() require("diffview.actions").select_entry() end,         { desc = "Open the diff for the selected entry" } },
          { "n", "-",             function() require("diffview.actions").toggle_stage_entry() end,   { desc = "Stage / unstage the selected entry" } },
          { "n", "S",             function() require("diffview.actions").stage_all() end,            { desc = "Stage all entries" } },
          { "n", "U",             function() require("diffview.actions").unstage_all() end,          { desc = "Unstage all entries" } },
          { "n", "X",             function() require("diffview.actions").restore_entry() end,        { desc = "Restore entry to the state on the left side" } },
          { "n", "R",             function() require("diffview.actions").refresh_files() end,        { desc = "Update stats and entries in the file list" } },
          { "n", "<leader>e",     function() require("diffview.actions").focus_files() end,          { desc = "Bring focus to the file panel" } },
          { "n", "<leader>b",     function() require("diffview.actions").toggle_files() end,         { desc = "Toggle the file panel" } },
          { "n", "g<C-x>",        function() require("diffview.actions").cycle_layout() end,         { desc = "Cycle through available layouts" } },
        },
        file_history_panel = {
          { "n", "g!",            function() require("diffview.actions").options() end,            { desc = "Open the option panel" } },
          { "n", "<C-A-d>",       function() require("diffview.actions").open_in_diffview() end,     { desc = "Open the entry under the cursor in a diffview" } },
          { "n", "y",             function() require("diffview.actions").copy_hash() end,           { desc = "Copy the commit hash of the entry under the cursor" } },
          { "n", "L",             function() require("diffview.actions").open_commit_log() end,      { desc = "Show commit details" } },
          { "n", "j",             function() require("diffview.actions").next_entry() end,          { desc = "Bring the cursor to the next file entry" } },
          { "n", "<down>",        function() require("diffview.actions").next_entry() end,          { desc = "Bring the cursor to the next file entry" } },
          { "n", "k",             function() require("diffview.actions").prev_entry() end,          { desc = "Bring the cursor to the previous file entry" } },
          { "n", "<up>",          function() require("diffview.actions").prev_entry() end,          { desc = "Bring the cursor to the previous file entry" } },
          { "n", "<cr>",          function() require("diffview.actions").select_entry() end,        { desc = "Open the diff for the selected entry" } },
          { "n", "o",             function() require("diffview.actions").select_entry() end,        { desc = "Open the diff for the selected entry" } },
        },
      },
    })

    -- Global keymaps for diffview
    vim.keymap.set("n", "<leader>gdo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
    vim.keymap.set("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
    vim.keymap.set("n", "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", { desc = "File History" })
    vim.keymap.set("n", "<leader>gdr", "<cmd>DiffviewRefresh<cr>", { desc = "Refresh Diffview" })
    vim.keymap.set("n", "<leader>gdt", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle File Panel" })
  end,
}