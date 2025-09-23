vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("mini_config", { clear = true }),
  callback = function()
    vim.schedule(function()
      require("mini.ai").setup({})
    end)
  end,
  once = true,
})
