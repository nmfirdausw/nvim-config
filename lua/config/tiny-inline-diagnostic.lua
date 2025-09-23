vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("diagnostic_config", { clear = true }),
  callback = function()
    vim.schedule(function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
        options = {
          show_source = { enabled = false },
          use_icons_from_diagnostic = true,
          throttle = 0,
          enable_on_insert = false,
        },
      })
    end)
  end,
  once = true,
})
