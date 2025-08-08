vim.g.diagnostics_enabled = true

vim.diagnostic.config({
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
  virtual_lines = {
    current_line = true,
  },
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:i",
  callback = function()
    if vim.g.diagnostics_enabled then
      vim.diagnostic.config({
        virtual_text = {
          current_line = true,
        },
        virtual_lines = false,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n",
  callback = function()
    if vim.g.diagnostics_enabled then
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = {
          current_line = true,
        },
      })
    end
  end,
})

-- Toggle diagnostics
vim.keymap.set("n", "<leader>td", function()
  vim.g.diagnostics_enabled = not vim.g.diagnostics_enabled
  if vim.g.diagnostics_enabled then
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "x",
          [vim.diagnostic.severity.WARN] = "!",
          [vim.diagnostic.severity.INFO] = "i",
          [vim.diagnostic.severity.HINT] = "?",
        },
      },
      underline = true,
      virtual_lines = {
        current_line = true,
      },
    })
    print("Diagnostics enabled")
  else
    vim.diagnostic.config({
      signs = false,
      underline = false,
      virtual_lines = false,
      virtual_text = false,
    })
    print("Diagnostics disabled")
  end
end, { desc = "Diagnostics" })
