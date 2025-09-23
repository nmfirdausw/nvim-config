local M = {}

M.is_git_dir = function()
  local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
  local gitdir = vim.fn.finddir(".git", cwd .. ";")
  return gitdir ~= ""
end

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

M.resize_splits = function(winid)
  if not vim.g.golden_ratio_splits then
    return
  end
  local columns = vim.opt.columns:get()
  local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
  local win_config = vim.api.nvim_win_get_config(winid)
  if win_config.relative ~= "" then
    return
  end
  local width = math.floor(columns * 0.618)
  local height = math.floor(lines * 0.618)
  if vim.api.nvim_win_get_width(winid) ~= columns then
    vim.api.nvim_win_set_width(winid, width)
  end
  if vim.api.nvim_win_get_height(winid) ~= lines then
    vim.api.nvim_win_set_height(winid, height)
  end
end

return M
