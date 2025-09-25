-- ============================================================================
-- Autocmds: Automatic commands for enhanced editor behavior
-- ============================================================================
-- Custom autocmds that automatically trigger based on various Neovim
-- events to improve the overall editing experience.

-- Automatically copy yanked text to system clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankToSystemClipboard", { clear = true }),
  callback = function()
    if vim.v.event.operator == "y" then
      vim.fn.setreg("+", vim.fn.getreg("\""))
    end
  end,
})

-- Clear search highlighting when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("ClearSearchOnInsert", { clear = true }),
  callback = function()
    vim.schedule(function()
      vim.cmd("nohlsearch")
    end)
  end,
})

-- Setup lsp after VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LspSetup", { clear = true }),
  callback = function()
    vim.schedule(function()
      require("config.lsp").setup()
      vim.lsp.inlay_hint.enable(vim.g.inlay_hints)
    end)
  end,
  once = true,
})
