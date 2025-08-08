vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
  },
  formatters = {
    stylua = {
      args = {
        "--indent-type=Spaces",
        "--indent-width=2",
        "--quote-style=ForceDouble",
        "-",
      },
    },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 2000,
  },
})

vim.keymap.set("n", "<leader>bf", function()
  require("conform").format({
    lsp_format = "fallback",
    timeout_ms = 2000,
  })
end, { desc = "Format" })

vim.keymap.set("v", "<leader>f", function()
  require("conform").format({
    range = {
      start = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    },
    timeout_ms = 2000,
  })
end, { desc = "Format" })
