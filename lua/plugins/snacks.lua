return {
  "folke/snacks.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>s",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.pickers()
      end,
      desc = "Pickers",
    },
    {
      "<leader><leader>",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>e",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>,",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>bb",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.buffers()
      end,
      desc = "Switch Buffer",
    },
    {
      "<leader>/",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.lines()
      end,
      desc = "Lines",
    },
    {
      "<leader>?",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>::",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>:",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>d",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>o",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>n",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.notifications()
      end,
      desc = "Notifications",
    },
    {
      "<leader>l",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.lsp_config()
      end,
      desc = "Lsp Config",
    },
    {
      "<leader>P",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>r",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
  },
  config = function()
    local picker = require("config.picker")
    require("snacks").setup({
      notifier = {
        enabled = false,
      },
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      picker = {
        layout = picker.layout.vertical_main,
        win = {
          list = {
            wo = {
              foldcolumn = "0",
            },
          },
          preview = {
            wo = {
              statuscolumn = "%{%v:lua._G.StatusColumn()%}",
              signcolumn = "yes",
              foldcolumn = "0",
              foldenable = false,
            },
          },
        },
        sources = {
          explorer = {
            supports_live = true,
            tree = true,
            watch = true,
            diagnostics = true,
            diagnostics_open = true,
            git_status = true,
            git_status_open = true,
            git_untracked = true,
            auto_close = true,
            layout = picker.layout.vertical_main,
          },
          pickers = {
            layout = picker.layout.vertical,
          },
          grep = {
            layout = picker.layout.horizontal_main,
          },
          lines = {
            layout = picker.layout.horizontal_main,
          },
          diagnostics = {
            layout = picker.layout.horizontal_main,
          },
          jumps = {
            layout = picker.layout.horizontal_main,
          },
          commands = {
            layout = picker.layout.horizontal,
          },
          command_history = {
            layout = picker.layout.horizontal,
          },
          lsp_config = {
            layout = picker.layout.full,
          },
          git_log = {
            layout = picker.layout.horizontal_main,
          },
          git_log_line = {
            layout = picker.layout.horizontal_main,
          },
          git_grep = {
            layout = picker.layout.horizontal_main,
          },
          git_stash = {
            layout = picker.layout.horizontal_main,
          },
          git_branches = {
            layout = picker.layout.horizontal_main,
          },
          registers = {
            layout = picker.layout.horizontal_main,
          },
        },
      },
    })
  end,
}
