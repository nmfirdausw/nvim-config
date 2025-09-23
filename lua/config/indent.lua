vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
  },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "php",
  },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
  end,
})
