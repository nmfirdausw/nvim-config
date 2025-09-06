local M = {}

-- Clean error messages by removing file paths and line numbers
function M.clean_error(err)
  local clean_err = tostring(err):match(": (.*)$") or tostring(err)
  clean_err = clean_err:gsub("^%d+: ", "") -- Remove line number prefix
  return clean_err
end

return M
