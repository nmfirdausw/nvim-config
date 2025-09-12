return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    { "<leader>bf", function()
      require("conform").format({
        lsp_format = "fallback",
        timeout_ms = 2000,
      })
    end, desc = "Format buffer", mode = "n" },
    { "<leader>f", function()
      require("conform").format({
        range = {
          start = vim.api.nvim_buf_get_mark(0, "<"),
          ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        },
        timeout_ms = 2000,
      })
    end, desc = "Format selection", mode = "v" },
    { "<leader>tf", function()
      vim.g.format_on_save = not vim.g.format_on_save
      local status = vim.g.format_on_save and "enabled" or "disabled"
      vim.notify("Format on save " .. status)
    end, desc = "Toggle format on save", mode = "n" },
  },
  config = function()
    require("conform").setup({
    formatters_by_ft = require("config.formatters").formatters_by_ft,
    formatters = require("config.formatters").formatters,
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function()
      if vim.g.format_on_save then
        return {
          lsp_format = "fallback",
          timeout_ms = 2000,
        }
      end
    end,
    })
  end,
}
