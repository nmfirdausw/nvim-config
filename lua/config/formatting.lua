vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

-- Enable or disable format on save
vim.g.format_on_save = true

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
  format_on_save = function(bufnr)
    if vim.g.format_on_save then
      return {
        lsp_format = "fallback",
        timeout_ms = 2000,
      }
    end
  end,
})

vim.keymap.set("n", "<leader>bf", function()
  require("conform").format({
    lsp_format = "fallback",
    timeout_ms = 2000,
  })
end, { desc = "Format buffer" })

vim.keymap.set("v", "<leader>f", function()
  require("conform").format({
    range = {
      start = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    },
    timeout_ms = 2000,
  })
end, { desc = "Format selection" })

vim.keymap.set("n", "<leader>tf", function()
  vim.g.format_on_save = not vim.g.format_on_save
  local status = vim.g.format_on_save and "enabled" or "disabled"
  vim.notify("Format on save " .. status)
end, { desc = "Toggle format on save" })
