local M = {}

M.layout = {
  vertical = function()
    local columns = vim.opt.columns:get()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local main_win_width = vim.api.nvim_win_get_width(MainWin)
    local main_win_pos = vim.api.nvim_win_get_position(MainWin)
    local main_win_col = main_win_pos[2]
    local width = columns - math.floor(columns * 0.618)
    local height = lines
    local col = columns - width

    if main_win_width < columns then
      width = columns - main_win_col - main_win_width
      col = columns - width
      if width < main_win_col then
        width = main_win_col
        col = 0
      end
    end

    return {
      layout = {
        backdrop = false,
        box = "horizontal",
        width = width,
        height = height,
        col = col,
        row = 0,
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
      },
    }
  end,

  vertical_preview = function()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local height = lines

    return {
      preview = "preview",
      layout = {
        backdrop = false,
        box = "horizontal",
        width = 0,
        height = height,
        col = 0,
        row = 0,
        {
          win = "preview",
          title = "{preview}",
          title_pos = "left",
          border = "rounded",
          width = 0.618,
        },
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
      },
    }
  end,

  vertical_main = function()
    local columns = vim.opt.columns:get()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local main_win_width = vim.api.nvim_win_get_width(MainWin)
    local main_win_pos = vim.api.nvim_win_get_position(MainWin)
    local main_win_col = main_win_pos[2]
    local width = columns - math.floor(columns * 0.618)
    local height = lines
    local col = columns - width

    if main_win_width < columns then
      width = columns - main_win_col - main_win_width
      col = columns - width
      if width < main_win_col then
        width = main_win_col
        col = 0
      end
    end

    return {
      preview = "main",
      layout = {
        backdrop = false,
        box = "horizontal",
        width = width,
        height = height,
        col = col,
        row = 0,
        {
          win = "preview",
          title = "{preview}",
          title_pos = "left",
          border = "rounded",
          width = 0.618,
        },
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
      },
    }
  end,

  horizontal = function()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local main_win_height = vim.api.nvim_win_get_height(MainWin)
    local main_win_pos = vim.api.nvim_win_get_position(MainWin)
    local main_win_row = main_win_pos[1]
    local height = lines - math.floor(lines * 0.618)
    local row = lines - height

    if main_win_height < lines then
      height = lines - main_win_row - main_win_height
      row = lines - height
      if height < main_win_row then
        height = main_win_row
        row = 0
      end
    end

    return {
      layout = {
        backdrop = false,
        box = "vertical",
        width = 0,
        height = height,
        col = 0,
        row = row,
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
      },
    }
  end,

  horizontal_preview = function()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local height = lines

    return {
      preview = "preview",
      layout = {
        backdrop = false,
        box = "vertical",
        width = 0,
        height = height,
        col = 0,
        row = 0,
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
        {
          win = "preview",
          title = "{preview}",
          title_pos = "right",
          border = "rounded",
          height = 0.618,
        },
      },
    }
  end,

  horizontal_main = function()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local main_win_height = vim.api.nvim_win_get_height(MainWin)
    local main_win_pos = vim.api.nvim_win_get_position(MainWin)
    local main_win_row = main_win_pos[1]
    local height = lines - math.floor(lines * 0.618)
    local row = lines - height

    if main_win_height < lines then
      height = lines - main_win_row - main_win_height
      row = lines - height
      if height < main_win_row then
        height = main_win_row
        row = 0
      end
    end

    return {
      preview = "main",
      layout = {
        backdrop = false,
        box = "vertical",
        width = 0,
        height = height,
        col = 0,
        row = row,
        {
          win = "preview",
          title = "{preview}",
          title_pos = "right",
          border = "rounded",
          height = 0.618,
        },
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
      },
    }
  end,

  full = function()
    local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    local height = lines

    return {
      layout = {
        backdrop = false,
        box = "vertical",
        width = 0,
        height = height,
        col = 0,
        row = 0,
        {
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = { "╭", "─", "╮", "│", "┤", "─", "├", "│" },
            title = "{title}",
            title_pos = "right",
          },
          {
            win = "list",
            border = { "", "", "", "│", "╯", "─", "╰", "│" },
          },
        },
      },
    }
  end,
}

return M
