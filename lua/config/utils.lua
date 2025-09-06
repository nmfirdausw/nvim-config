local M = {}

-- Clean error messages by removing file paths and line numbers
function M.clean_error(err)
  local clean_err = tostring(err):match(": (.*)$") or tostring(err)
  clean_err = clean_err:gsub("^%d+: ", "") -- Remove line number prefix
  return clean_err
end

M.is_git_dir = function()
  local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
  local gitdir = vim.fn.finddir(".git", cwd .. ";")
  return gitdir ~= ""
end

return M
