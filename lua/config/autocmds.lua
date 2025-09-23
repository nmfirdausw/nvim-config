vim.api.nvim_create_autocmd({ "WinLeave", "WinEnter" }, {
  callback = function()
    if vim.bo.buftype ~= "" then
      return
    end

    local main_win = vim.api.nvim_get_current_win()

    MainWin = main_win
    Utils.resize_splits(MainWin)
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    Utils.resize_splits(MainWin)
  end,
})
