local M = {}

M.linters = {}

M.linters_by_ft = {
  blade = { "htmlhint" },
  html = { "tidy" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  php = { "tlint", "phpcs", "phpstan" },
  python = { "mypy", "ruff" },
  yaml = { "yamllint" },
}

return M
