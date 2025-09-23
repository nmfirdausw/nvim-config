vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("whickey_config", { clear = true }),
  callback = function()
    vim.schedule(function()
      require("which-key").setup({
        win = {
          no_overlap = true,
          col = 0,
          border = vim.g.border,
        },
        icons = {
          mappings = false,
        },
        spec = {
          { "<leader>t", desc = "Toggle" },
          { "<leader>b", desc = "Buffer" },
        },
      })
    end)
  end,
  once = true,
})
