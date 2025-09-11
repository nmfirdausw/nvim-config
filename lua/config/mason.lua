vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup({
  ui = {
    border = vim.g.border,
    icons = {
      package_installed = "+",
      package_pending = "!",
      package_uninstalled = "x",
    },
  },
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "blade-formatter",
    "css-lsp",
    "css-variables-language-server",
    "cssmodules-language-server",
    "html-lsp",
    "lua-language-server",
    "prettierd",
    "roslyn",
    "rzls",
    "stylua",
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
})
