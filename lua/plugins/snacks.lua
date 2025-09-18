return {
  "folke/snacks.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<BS>",
      function()
        Utils.close_all_floating_win()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader><leader>",
      function()
        Utils.close_all_floating_win()
        Snacks.picker.autocmds()
      end,
      desc = "File Explorer",
    },
  },
  config = function()
    local vertical = function()
      local columns = vim.o.columns
      local main_win_width = vim.api.nvim_win_get_width(MainWin)
      local main_win_pos = vim.api.nvim_win_get_position(MainWin)
      local main_win_col = main_win_pos[2]
      local width = columns - math.floor(columns / 1.618)
      local border = "left"
      if not PickerGoldenV then
        if PickerPosV == 0 then
          width = main_win_col
          border = "right"
        else
          width = columns - main_win_col - main_win_width
        end
      end

      return {
        preview = "main",
        layout = {
          box = "horizontal",
          width = width,
          min_width = 1,
          row = 0,
          col = PickerPosV,
          height = vim.o.lines - vim.opt.cmdheight:get() - 1,
          { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
          {
            box = "vertical",
            border = border,
            {
              win = "input",
              height = 1,
              border = "rounded",
            },
            { win = "list", border = "none" },
          },
        },
      }
    end

    -- horizontal function
    local horizontal = function()
      local columns = vim.o.columns
      local lines = vim.o.lines
      local main_win_height = vim.api.nvim_win_get_height(MainWin)
      local main_win_pos = vim.api.nvim_win_get_position(MainWin)
      local main_win_row = main_win_pos[1]
      local height = lines - math.floor(lines / 1.618)
      local layout = {
        preview = "main",
        layout = {
          box = "horizontal",
          width = columns,
          min_width = 1,
          row = PickerPosH,
          col = 0,
          height = height,
          { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
          {
            box = "vertical",
            border = "top",
            {
              win = "input",
              height = 1,
              border = "bottom",
            },
            { win = "list", border = "none" },
          },
        },
      }
      if not PickerGoldenH then
        if PickerPosH == 0 then
          height = main_win_row
          layout = {
            preview = "main",
            reverse = true,
            layout = {
              box = "horizontal",
              width = columns,
              min_width = 1,
              row = PickerPosH,
              col = 0,
              height = height,
              { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
              {
                box = "vertical",
                border = "bottom",
                { win = "list", border = "none" },
                {
                  win = "input",
                  height = 1,
                  border = "top",
                },
              },
            },
          }
        else
          height = lines - main_win_row - main_win_height
        end
      end
      return layout
    end
    require("snacks").setup({
      notifier = {
        enabled = false,
      },
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      picker = {
        layout = vertical,
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
            layout = vertical,
          },
          autocmds = {
            layout = horizontal,
          },
        },
      },
    })
  end,
}
