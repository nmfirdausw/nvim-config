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

M.get_split_count = function()
  return #vim.tbl_filter(function(win)
    return vim.api.nvim_win_get_config(win).relative == ""
  end, vim.api.nvim_tabpage_list_wins(0))
end

return M
