vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason-lspconfig").setup({
  automatic_enable = {
    exclude = {
      "roslyn",
      "rzls",
    },
  },
})

-- LSP setting
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

vim.lsp.config("html", {
  filetypes = { "html", "razor" },
})
