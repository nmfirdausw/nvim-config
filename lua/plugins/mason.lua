return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = {
    "MasonToolsClean",
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonetoolsUpdateSync",
  },
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
      "typescript-language-server",
    },
    auto_update = false,
    run_on_start = false,
    start_delay = 3000,
  },
}
