return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    event = "VeryLazy",
    ft = { "markdown" },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    config = function()
      local render_markdown = require('render-markdown')
      render_markdown.setup({
        enabled = true,
        max_file_size = 5.0,
        debounce = 100,
        render_modes = { 'n', 'c' },
        anti_conceal = {
          enabled = true,
          above = 0,
          below = 0,
        },
        heading = {
          enabled = true,
          sign = true,
          position = 'overlay',
          icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
          signs = { '󰫎 ' },
          width = 'full',
          left_pad = 0,
          right_pad = 0,
          min_width = 0,
          border = false,
          above = '▄',
          below = '▀',
        },
        paragraph = {
          enabled = true,
          left_margin = 0,
          min_width = 0,
        },
        code = {
          enabled = true,
          sign = true,
          style = 'full',
          position = 'left',
          language_pad = 0,
          disable_background = { 'diff' },
          width = 'full',
          left_pad = 0,
          right_pad = 0,
          min_width = 0,
          border = 'thin',
          above = '▄',
          below = '▀',
          highlight = 'RenderMarkdownCode',
          highlight_inline = 'RenderMarkdownCodeInline',
        },
        dash = {
          enabled = true,
          icon = '─',
          width = 'full',
          highlight = 'RenderMarkdownDash',
        },
        bullet = {
          enabled = true,
          icons = { '●', '○', '◆', '◇' },
          left_pad = 0,
          right_pad = 0,
          highlight = 'RenderMarkdownBullet',
        },
        checkbox = {
          enabled = true,
          position = 'inline',
          unchecked = {
            icon = '󰄱 ',
            highlight = 'RenderMarkdownUnchecked',
          },
          checked = {
            icon = '󰱒 ',
            highlight = 'RenderMarkdownChecked',
          },
          custom = {
            todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
          },
        },
        quote = {
          enabled = true,
          icon = '▋',
          repeat_linebreak = false,
          highlight = 'RenderMarkdownQuote',
        },
        pipe_table = {
          enabled = true,
          preset = 'none',
          style = 'full',
          cell = 'padded',
          min_width = 0,
          border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
          },
          alignment_indicator = '━',
          head = 'RenderMarkdownTableHead',
          row = 'RenderMarkdownTableRow',
          filler = 'RenderMarkdownTableFill',
        },
        callout = {
          note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
          tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
          important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
          warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
          caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
          abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
          summary = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo' },
          tldr = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo' },
          info = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo' },
          todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
          hint = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess' },
          success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
          check = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess' },
          done = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess' },
          question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
          help = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn' },
          faq = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn' },
          attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
          failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
          fail = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError' },
          missing = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError' },
          danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
          error = { raw = '[!ERROR]', rendered = '󰅖 Error', highlight = 'RenderMarkdownError' },
          bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
          example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
          quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
          cite = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote' },
        },
        link = {
          enabled = true,
          image = '󰥶 ',
          email = '󰀓 ',
          hyperlink = '󰖟 ',
          highlight = 'RenderMarkdownLink',
          custom = {
            web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
          },
        },
        sign = {
          enabled = true,
          highlight = 'RenderMarkdownSign',
        },
      })
      
      -- Add keymaps for controlling render-markdown
      vim.keymap.set("n", "<leader>mr", function()
        render_markdown.toggle()
      end, { desc = "Toggle Markdown Rendering" })
      
      vim.keymap.set("n", "<leader>me", function()
        render_markdown.enable()
      end, { desc = "Enable Markdown Rendering" })
      
      vim.keymap.set("n", "<leader>md", function()
        render_markdown.disable()
      end, { desc = "Disable Markdown Rendering" })
    end,
  },
  { 'folke/neodev.nvim', event = "VeryLazy", opts = {} },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup({
        default_mappings = true,
      })
    end,
  },
  { 'brenoprata10/nvim-highlight-colors' },
  { "tpope/vim-projectionist" },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = true,
  },
  { "mfussenegger/nvim-jdtls", ft = {"kotlin", "java"} },
  {
    "keith/swift.vim",
    ft = "swift",
  },
  -- Enhanced Swift support
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup({
        xcode_developer_path = "/Applications/Xcode-beta.app/Contents/Developer",
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["q"] = "actions.close",
        },
      })
    end,
  },
  { "preservim/vim-pencil", event = "VeryLazy" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      { "<leader>nm", "<cmd>Noice last<cr>", desc = "Show last message" },
      { "<leader>nh", "<cmd>Noice history<cr>", desc = "Show message history" },
      { "<leader>nt", "<cmd>Noice telescope<cr>", desc = "Browse messages with Telescope" },
      { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss all messages" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        kotlin = { "ktlint" },
        terraform = { "tflint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          svelte = { "prettierd", "prettier", stop_after_first = true },
          astro = { "prettierd", "prettier", stop_after_first = true },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          graphql = { "prettierd", "prettier", stop_after_first = true },
          java = { "google-java-format" },
          kotlin = { "ktlint" },
          ruby = { "standardrb" },
          markdown = { "prettierd", "prettier", stop_after_first = true },
          erb = { "htmlbeautifier" },
          html = { "htmlbeautifier" },
          bash = { "beautysh" },
          proto = { "buf" },
          rust = { "rustfmt" },
          yaml = { "yamlfix" },
          toml = { "taplo" },
          css = { "prettierd", "prettier", stop_after_first = true },
          scss = { "prettierd", "prettier", stop_after_first = true },
          sh = { "shellcheck" },
          go = { "gofmt" },
          xml = { "xmllint" },
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>lf", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    config = function()
      require("treesitter-context").setup({
        max_lines = 5,
      })
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate")
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      jump = {
        autojump = true,
      },
      modes = {
        char = {
          jump_labels = true,
          multi_line = false,
        }
      }
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n" },           function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-f>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        enable_builtin = true,
        use_local_fs = true,
      })
      vim.cmd([[hi OctoEditable guibg=none]])
      vim.treesitter.language.register("markdown", "octo")
    end,
    keys = {
      { "<leader>O",  "<cmd>Octo<cr>",         desc = "Octo" },
      { "<leader>Op", "<cmd>Octo pr list<cr>", desc = "Octo pr list" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
    lazy = true,
    event = "VeryLazy",
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "erlang",
          "heex",
          "eex",
          "kotlin",
          "jq",
          "dockerfile",
          "json",
          "html",
          "terraform",
          "go",
          "tsx",
          "bash",
          "ruby",
          "markdown",
          "java",
          "astro",
          "swift",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gs",
            node_incremental = "gs",
            scope_incremental = "gS",
            node_decremental = "gl",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>p"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>ps"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", event = "VeryLazy", build = "make" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive Panel" })
    end,
  },
  {"tpope/vim-repeat", event = "VeryLazy"},
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
      "zidhuss/neotest-minitest",
      "mfussenegger/nvim-dap",
      "jfpedroza/neotest-elixir",
      "weilbith/neotest-gradle",
      "nvim-neotest/neotest-go",
    },
    opts = {},
    config = function()
      local neotest = require("neotest")

      local neotest_jest = require("neotest-jest")({
        jestCommand = "npm test --",
      })
      neotest_jest.filter_dir = function(name)
        return name ~= "node_modules" and name ~= "__snapshots__"
      end

      neotest.setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
          }),
          neotest_jest,
          require("neotest-minitest"),
          require("neotest-elixir"),
          require("neotest-go"),
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 15",
        },
        quickfix = {
          open = false,
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dap.set_log_level('INFO')
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
      {
        "suketa/nvim-dap-ruby",
        config = function()
          require("dap-ruby").setup()
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = {
            "delve"
          },
        },
      },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {
            { "fileformat", "filetype" },
            {
              function()
                local ok, gather = pcall(vim.fn['floaterm#buflist#gather'])
                if not ok then return '' end
                
                local buffers = gather
                local count = #buffers
                if count == 0 then return '' end
                
                local current_ok, current = pcall(vim.fn['floaterm#buflist#curr'])
                if not current_ok then return '' end
                
                local index = 0
                for i, bufnr in ipairs(buffers) do
                  if bufnr == current then
                    index = i
                    break
                  end
                end
                
                return string.format('󰆍 %d/%d', index, count)
              end,
              cond = function()
                local ok, gather = pcall(vim.fn['floaterm#buflist#gather'])
                return ok and gather and #gather > 0
              end,
              color = { fg = "#7aa2f7" },
            },
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "fugitive", "quickfix", "fzf", "lazy", "mason", "nvim-dap-ui", "oil", "trouble" },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "junegunn/fzf",
    event = "VeryLazy",
    build = ":call fzf#install()",
  },
  { "nanotee/zoxide.vim", event = "VeryLazy" },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>e",
        "<cmd>Yazi<cr>",
        desc = "Open Yazi",
      },
      {
        "<leader>ew",
        "<cmd>Yazi cwd<cr>",
        desc = "Open Yazi in working directory",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
  { "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },
  { "debugloop/telescope-undo.nvim", event = "VeryLazy" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        triggers = {
          { "<auto>", mode = "nxso" },
        },
      })
      
      -- Register group descriptions using new spec format
      wk.add({
        { "<leader>f", group = "Find (Telescope)" },
        { "<leader>t", group = "Terminals" },
        { "<leader>T", group = "Tabs" },
        { "<leader>w", group = "Windows/Splits" },
        { '<leader>"', group = "Tests" },
        { "<leader>d", group = "Debug" },
        { "<leader>db", group = "Breakpoints" },
        { "<leader>m", group = "Markdown" },
        { "<leader>c", group = "Copy" },
        { "<leader>v", group = "Vim Config" },
        { "<leader>g", group = "Git" },
        { "<leader>R", group = "Refactor" },
        { "<leader>n", group = "Noice/Notes" },
        { "<leader>e", group = "Explore (Yazi)" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>l", group = "Linting/LazyGit" },
        { "<leader>o", group = "OpenCode" },
        { "<leader>q", group = "Trouble/Quickfix" },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = 'curved',
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          }
        }
      })

      -- Tab-like terminal management (numbered terminals 1-4)
      vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<cr>", { desc = "Terminal 1" })
      vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<cr>", { desc = "Terminal 2" })
      vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<cr>", { desc = "Terminal 3" })
      vim.keymap.set("n", "<leader>t4", "<cmd>4ToggleTerm<cr>", { desc = "Terminal 4" })

      -- Layout options
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
      vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal terminal" })
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical terminal" })
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

      -- Terminal navigation
      vim.keymap.set("n", "<leader>tn", "<cmd>ToggleTerm<cr>", { desc = "New/Toggle terminal" })
      vim.keymap.set("n", "<leader>tk", function()
        local current_term = require("toggleterm.terminal").get_focused_id()
        if current_term then
          vim.cmd(current_term .. "ToggleTermKill")
        end
      end, { desc = "Kill current terminal" })

      -- Specialized terminal functions
      local Terminal = require('toggleterm.terminal').Terminal

      -- Dedicated LazyGit terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = { 
          border = "double",
          width = 0.9,
          height = 0.9,
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
      })
      vim.keymap.set("n", "<leader>lg", function() lazygit:toggle() end, { desc = "LazyGit" })

      -- Node REPL terminal
      local node = Terminal:new({ 
        cmd = "node", 
        direction = "horizontal",
        hidden = true 
      })
      vim.keymap.set("n", "<leader>tr", function() node:toggle() end, { desc = "Node REPL" })

      -- Enhanced terminal navigation keymaps
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end,
  },
  {
    "tummetott/unimpaired.nvim",
    event = "VeryLazy",
    config = function()
      require("unimpaired").setup()
    end,
  },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  { "tpope/vim-rails", event = "VeryLazy" },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "standardrb",
          "prettier",
          "prettierd",
          "ktlint",
          "eslint_d",
          "google-java-format",
          "htmlbeautifier",
          "beautysh",
          "buf",
          "rustfmt",
          "yamlfix",
          "taplo",
          "shellcheck",
          "gopls",
          "delve",
          "astro-language-server",
        },
      })
    end,
  },
  { "nvim-telescope/telescope-live-grep-args.nvim", event = "VeryLazy" },
  {
    "aaronhallaert/advanced-git-search.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'}
      vim.g.lazygit_floating_window_use_plenary = 0
      vim.g.lazygit_use_neovim_remote = 1
    end,
  },
  {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy", -- Or `LspAttach`
      priority = 1000, -- needs to be loaded in first
      config = function()
          require('tiny-inline-diagnostic').setup()
          vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
          require("tiny-inline-diagnostic").setup({
              -- Style preset for diagnostic messages
              -- Available options:
              -- "modern", "classic", "minimal", "powerline",
              -- "ghost", "simple", "nonerdfont", "amongus"
              preset = "modern",

              transparent_bg = false, -- Set the background of the diagnostic to transparent
              transparent_cursorline = false, -- Set the background of the cursorline to transparent (only one the first diagnostic)

              hi = {
                  error = "DiagnosticError", -- Highlight group for error messages
                  warn = "DiagnosticWarn", -- Highlight group for warning messages
                  info = "DiagnosticInfo", -- Highlight group for informational messages
                  hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
                  arrow = "NonText", -- Highlight group for diagnostic arrows

                  -- Background color for diagnostics
                  -- Can be a highlight group or a hexadecimal color (#RRGGBB)
                  background = "CursorLine",

                  -- Color blending option for the diagnostic background
                  -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
                  mixing_color = "None",
              },

              options = {
                  -- Display the source of the diagnostic (e.g., basedpyright, vsserver, lua_ls etc.)
            show_source = {
                enabled = false,
                if_many = false,
            },

                  -- Use icons defined in the diagnostic configuration
                  use_icons_from_diagnostic = false,

                  -- Set the arrow icon to the same color as the first diagnostic severity
                  set_arrow_to_diag_color = false,

                  -- Add messages to diagnostics when multiline diagnostics are enabled
                  -- If set to false, only signs will be displayed
                  add_messages = true,

                  -- Time (in milliseconds) to throttle updates while moving the cursor
                  -- Increase this value for better performance if your computer is slow
                  -- or set to 0 for immediate updates and better visual
                  throttle = 20,

                  -- Minimum message length before wrapping to a new line
                  softwrap = 30,

                  -- Configuration for multiline diagnostics
                  -- Can either be a boolean or a table with the following options:
                  --  multilines = {
                  --      enabled = false,
                  --      always_show = false,
                  -- }
                  -- If it set as true, it will enable the feature with this options:
                  --  multilines = {
                  --      enabled = true,
                  --      always_show = false,
                  -- }
                  multilines = {
                      -- Enable multiline diagnostic messages
                      enabled = false,

                      -- Always show messages on all lines for multiline diagnostics
                      always_show = false,

                      -- Trim whitespaces from the start/end of each line
                      trim_whitespaces = false,

                      -- Replace tabs with spaces in multiline diagnostics
                      tabstop = 4,
                  },

                  -- Display all diagnostic messages on the cursor line
                  show_all_diags_on_cursorline = false,

                  -- Enable diagnostics in Insert mode
                  -- If enabled, it is better to set the `throttle` option to 0 to avoid visual artifacts
                  enable_on_insert = false,

              -- Enable diagnostics in Select mode (e.g when auto inserting with Blink)
                  enable_on_select = false,

                  overflow = {
                      -- Manage how diagnostic messages handle overflow
                      -- Options:
                      -- "wrap" - Split long messages into multiple lines
                      -- "none" - Do not truncate messages
                      -- "oneline" - Keep the message on a single line, even if it's long
                      mode = "wrap",

                      -- Trigger wrapping to occur this many characters earlier when mode == "wrap".
                      -- Increase this value appropriately if you notice that the last few characters
                      -- of wrapped diagnostics are sometimes obscured.
                      padding = 0,
                  },

                  -- Configuration for breaking long messages into separate lines
                  break_line = {
                      -- Enable the feature to break messages after a specific length
                      enabled = false,

                      -- Number of characters after which to break the line
                      after = 30,
                  },

                  -- Custom format function for diagnostic messages
                  -- Example:
                  -- format = function(diagnostic)
                  --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
                  -- end
                  format = nil,


                  virt_texts = {
                      -- Priority for virtual text display
                      priority = 2048,
                  },

                  -- Filter diagnostics by severity
                  -- Available severities:
                  -- vim.diagnostic.severity.ERROR
                  -- vim.diagnostic.severity.WARN
                  -- vim.diagnostic.severity.INFO
                  -- vim.diagnostic.severity.HINT
                  severity = {
                      vim.diagnostic.severity.ERROR,
                      vim.diagnostic.severity.WARN,
                      vim.diagnostic.severity.INFO,
                      vim.diagnostic.severity.HINT,
                  },

                  -- Events to attach diagnostics to buffers
                  -- You should not change this unless the plugin does not work with your configuration
                  overwrite_events = nil,
              },
              disabled_ft = {} -- List of filetypes to disable the plugin
          })
      end
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        warn_no_results = false,
        open_no_results = true,
      })

      -- Trouble keymaps using <leader>q prefix to avoid conflict with <leader>x
      vim.keymap.set("n", "<leader>qq", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })
      vim.keymap.set("n", "<leader>qw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
      vim.keymap.set("n", "<leader>qd", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace Diagnostics" })
      vim.keymap.set("n", "<leader>ql", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
      vim.keymap.set("n", "<leader>qf", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })
      vim.keymap.set("n", "<leader>qr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP References" })
      
      -- Copy diagnostic message
      vim.keymap.set("n", "<leader>qy", function()
        local trouble = require("trouble")
        if trouble.is_open() then
          local item = trouble.get_cursor_item()
          if item and item.message then
            vim.fn.setreg("+", item.message)
            vim.notify("Copied: " .. item.message)
          end
        end
      end, { desc = "Copy diagnostic message" })
      
      -- Navigation
      vim.keymap.set("n", "]q", function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end, { desc = "Next trouble/quickfix item" })
      
      vim.keymap.set("n", "[q", function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end, { desc = "Previous trouble/quickfix item" })
    end,
  },
  {
    "NickvanDyke/opencode.nvim",
    event = "VeryLazy",
    dependencies = { "folke/snacks.nvim" },
    opts = {},
    keys = {
      { "<leader>ot", function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
      { "<leader>oa", function() require("opencode").ask() end, desc = "Ask opencode", mode = "n" },
      { "<leader>oa", function() require("opencode").ask("@selection: ") end, desc = "Ask opencode about selection", mode = "v" },
      { "<leader>op", function() require("opencode").select_prompt() end, desc = "Select prompt", mode = { "n", "v" } },
      { "<leader>on", function() require("opencode").command("session_new") end, desc = "New session" },
      { "<leader>oy", function() require("opencode").command("messages_copy") end, desc = "Copy last message" },
      { "<S-C-u>", function() require("opencode").command("messages_half_page_up") end, desc = "Scroll messages up" },
      { "<S-C-d>", function() require("opencode").command("messages_half_page_down") end, desc = "Scroll messages down" },
    },
  },

}
