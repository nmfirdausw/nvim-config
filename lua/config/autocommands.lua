-- Resize splits to golden ratio
local resize_splits = function(winid)
  if not vim.g.golden_ratio_splits then
    return
  end
  local columns = vim.opt.columns:get()
  local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
  local win_config = vim.api.nvim_win_get_config(winid)
  if win_config.relative ~= "" then
    return
  end
  local width = math.floor(columns / 1.618)
  local height = math.floor(lines / 1.618)
  if vim.api.nvim_win_get_width(winid) ~= columns then
    vim.api.nvim_win_set_width(winid, width)
  end
  if vim.api.nvim_win_get_height(winid) ~= lines then
    vim.api.nvim_win_set_height(winid, height)
  end
end

local set_picker_vertical_win = function(winid)
  local main_win_width = vim.api.nvim_win_get_width(winid)
  local columns = vim.opt.columns:get()
  local width = columns - math.floor(columns / 1.618)
  PickerPosV = columns

  if main_win_width == columns then
    PickerGoldenV = true
  else
    local main_win_pos = vim.api.nvim_win_get_position(winid)
    local main_win_col = main_win_pos[2]
    width = columns - main_win_col - main_win_width
    PickerGoldenV = false
    if width < main_win_col then
      PickerPosV = 0
    else
      PickerPosV = columns
    end
  end
end

local set_picker_horizontal_win = function(winid)
  local main_win_height = vim.api.nvim_win_get_height(winid)
  local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
  local height = lines - math.floor(lines / 1.618)
  PickerPosH = lines - height - 1

  if main_win_height == lines then
    PickerGoldenH = true
  else
    local main_win_pos = vim.api.nvim_win_get_position(winid)
    local main_win_row = main_win_pos[1]
    height = lines - main_win_row - main_win_height
    PickerGoldenH = false
    if height < main_win_row then
      PickerPosH = 0
    else
      PickerPosH = lines - height - 1
    end
  end
end

vim.api.nvim_create_autocmd({ "WinLeave", "WinEnter" }, {
  callback = function()
    if vim.bo.buftype ~= "" then
      return
    end

    local main_win = vim.api.nvim_get_current_win()

    MainWin = main_win
    resize_splits(MainWin)
    set_picker_vertical_win(MainWin)
    set_picker_horizontal_win(MainWin)
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "WinEnter" }, {
  callback = function()
    if vim.bo.filetype == "lazy" then
      vim.cmd("q")
    end
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    resize_splits(MainWin)
    set_picker_vertical_win(MainWin)
    set_picker_horizontal_win(MainWin)
  end,
})
