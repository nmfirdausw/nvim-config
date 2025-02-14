local M = {}

M.gitdir = function()
  local gitdir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')
  return gitdir ~= ''
end

return M
