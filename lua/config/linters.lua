local M = {}

M.linters = {}

M.linters_by_ft = {
  blade = { "htmlhint" },
  html = { "tidy" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  php = { "tlint", "phpcs", "phpstan" },
  python = { "mypy", "ruff" },
  toml = { "tombi" },
  yaml = { "yamllint" },
}

return M
