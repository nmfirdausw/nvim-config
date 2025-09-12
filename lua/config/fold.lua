local M = {}

M.options = {
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  fillchars = {
    foldopen = "-",
    foldclose = "+",
  },
}

M.ftprovider = {
  html = "indent",
  lua = "indent",
}

return M
