return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
  },
  opts = {
    automatic_enable = {
      exclude = {
        "roslyn",
        "rzls",
      },
    },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
    require("config.lsp")
  end,
}
