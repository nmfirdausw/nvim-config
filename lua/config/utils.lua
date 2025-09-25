-- ============================================================================
-- Utils: Common utility functions
-- ============================================================================
-- Reusable utility functions for Neovim configuration and plugin management.

local M = {}

-- Check if the current working directory is a Git repository
M.is_git_dir = function()
  local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
  local gitdir = vim.fn.finddir(".git", cwd .. ";")
  return gitdir ~= ""
end

-- Close all floating windows in the current tab
M.close_all_floating_win = function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, win in ipairs(wins) do
    if vim.api.nvim_win_is_valid(win) then
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then
        vim.api.nvim_win_close(win, true)
      end
    end
  end
end

-- Trim common Neovim plugin prefixes and suffixes from plugin names
function M.trim_plugin_name(name)
  if not name or type(name) ~= "string" then
    return name or ""
  end

  local result = name
  result = result:gsub("^[Nn][Vv][Ii][Mm]%-", "")
  result = result:gsub("%.[Nn][Vv][Ii][Mm]$", "")
  result = result:gsub("%.[Ll][Uu][Aa]$", "")
  result = result:lower()
  result = result:gsub("%.", "-")

  return result
end

function M.equalize_other_splits()
  local current_win = vim.api.nvim_get_current_win()
  local current_pos = vim.api.nvim_win_get_position(current_win)
  local current_width = vim.api.nvim_win_get_width(current_win)
  local current_height = vim.api.nvim_win_get_height(current_win)

  local wins = vim.api.nvim_list_wins()
  local horizontal_wins = {} -- same row as current
  local vertical_wins = {} -- same column as current

  -- Categorize other windows
  for _, win in ipairs(wins) do
    if win ~= current_win then
      local config = vim.api.nvim_win_get_config(win)
      if config.relative == "" then -- not floating
        local pos = vim.api.nvim_win_get_position(win)

        if pos[1] == current_pos[1] then -- same row
          table.insert(horizontal_wins, win)
        elseif pos[2] == current_pos[2] then -- same column
          table.insert(vertical_wins, win)
        end
      end
    end
  end

  -- Equalize windows in same row (adjust width)
  if #horizontal_wins > 0 then
    local available_width = vim.o.columns - current_width
    local width_per_win = math.floor(available_width / #horizontal_wins)

    for _, win in ipairs(horizontal_wins) do
      vim.api.nvim_win_set_width(win, width_per_win)
    end
  end

  -- Equalize windows in same column (adjust height)
  if #vertical_wins > 0 then
    local available_height = vim.o.lines - vim.o.cmdheight - 1 - current_height
    local height_per_win = math.floor(available_height / #vertical_wins)

    for _, win in ipairs(vertical_wins) do
      vim.api.nvim_win_set_height(win, height_per_win)
    end
  end
end

function M.resize_splits(main_win)
  if vim.g.auto_resize_splits == false then
    return
  end

  -- Skip if main_win is floating
  local win_config = vim.api.nvim_win_get_config(main_win)
  if win_config.relative ~= "" then
    return
  end

  local splits_ratio = vim.g.splits_ratio or 0.618
  local columns = vim.opt.columns:get()
  local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local normal_wincount = 0

  -- Count normal (non-floating) windows
  for _, win in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative == "" then
      normal_wincount = normal_wincount + 1
    end
  end

  -- Single normal window - full size
  if normal_wincount == 1 then
    vim.api.nvim_win_set_width(main_win, columns)
    vim.api.nvim_win_set_height(main_win, lines)
    return
  end

  -- Multiple windows - golden ratio for focused window
  local width = math.floor(columns * splits_ratio)
  local height = math.floor(lines * splits_ratio)

  -- Only resize if not already full screen
  local current_width = vim.api.nvim_win_get_width(main_win)
  local current_height = vim.api.nvim_win_get_height(main_win)

  if current_width ~= columns then
    vim.api.nvim_win_set_width(main_win, width)
  end
  if current_height ~= lines then
    vim.api.nvim_win_set_height(main_win, height)
  end

  M.equalize_other_splits()
end

return M
