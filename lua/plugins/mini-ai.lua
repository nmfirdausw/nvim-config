vim.api.nvim_create_autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("MiniAiSetup", { clear = true }),
  callback = function()
    vim.schedule(function()
      vim.cmd.packadd("mini.ai")
      require("mini.ai").setup({})
    end)
  end,
  once = true,
})
