return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ui = {
        border = vim.g.border,
        backdrop = 100,
        icons = {
          package_installed = "+",
          package_pending = "!",
          package_uninstalled = "x",
        },
      },
    },
  },
  opts = {
    ensure_installed = {
      "angular-language-server",
      "biome",
      "css-lsp",
      "css-variables-language-server",
      "cssmodules-language-server",
      "eslint-lsp",
      "html-lsp",
      "htmlhint",
      "jsonlint",
      "lua-language-server",
      "luacheck",
      "mypy",
      "prettierd",
      "python-lsp-server",
      "roslyn",
      "ruff",
      "rzls",
      "stylua",
      "tlint",
      "typescript-language-server",
      "yamllint",
      "taplo",
    },

    auto_update = true,
    run_on_start = true,
    start_delay = 3000,
  },
}
