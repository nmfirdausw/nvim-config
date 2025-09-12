local M = {}

M.formatters_by_ft = {
  blade = { "blade-formatter", "pint" },
  css = { "biome-check" },
  fish = { "fish_indent" },
  html = { "prettierd" },
  javascript = { "biome-check" },
  json = { "biome-check" },
  jsonc = { "biome-check" },
  less = { "prettier" },
  lua = { "stylua" },
  php = { "duster", "pint", "php_cs_fixer", stop_after_first = true },
  python = { "ruff_organize_imports", "ruff_format" },
  scss = { "prettier" },
  sh = { "shfmt" },
  toml = { "taplo" },
  typescript = { "biome-check" },
  yaml = { "yamlfmt" },
}

M.formatters = {
  stylua = {
    args = {
      "--indent-type=Spaces",
      "--indent-width=2",
      "--quote-style=ForceDouble",
      "-",
    },
  },
  duster = {
    command = require("conform.util").find_executable({ "vendor/bin/duster" }, "duster"),
    args = { "fix", "--quiet", "$FILENAME" },
    stdin = false,
  },
}

return M
