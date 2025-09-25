-- ============================================================================
-- Diagnostics: Error, warning, and info display configuration
-- ============================================================================
-- Configures how LSP diagnostics are displayed and provides toggle functionality.

local opts = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "x",
      [vim.diagnostic.severity.WARN] = "!",
      [vim.diagnostic.severity.INFO] = "i",
      [vim.diagnostic.severity.HINT] = "?",
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = false,
  virtual_lines = false,
  float = {
    border = vim.g.border,
  },
}

vim.diagnostic.config(opts)

-- Toggle diagnostics
vim.keymap.set("n", "<leader>td", function()
  local diag = require("tiny-inline-diagnostic")
  vim.g.diagnostics = not vim.g.diagnostics
  if vim.g.diagnostics then
    vim.diagnostic.config(opts)
    diag.enable()
    vim.notify("Diagnostics enabled")
  else
    vim.diagnostic.config({
      signs = false,
      underline = false,
      virtual_lines = false,
      virtual_text = false,
    })
    diag.disable()
    vim.notify("Diagnostics disabled")
  end
end, { desc = "Toggle diagnostics" })
