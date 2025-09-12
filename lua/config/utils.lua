local M = {}

M.is_git_dir = function()
  local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
  local gitdir = vim.fn.finddir(".git", cwd .. ";")
  return gitdir ~= ""
end

return M
