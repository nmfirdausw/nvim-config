vim.lsp.enable({
  "lua_ls",
})

vim.api.nvim_create_autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("InlayHintsRefresh", { clear = true }),
  callback = function(args)
    vim.lsp.inlay_hint.enable(vim.g.inlay_hints)
  end,
  once = true,
})

vim.keymap.set("n", "<leader>ti", function()
  local current_state = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not current_state)
  print("Inlay hints " .. (not current_state and "enabled" or "disabled"))
end, { desc = "Toggle inlay hints" })

local codelens_group = nil

local function enable_codelens()
  vim.lsp.codelens.refresh()

  if not codelens_group then
    codelens_group = vim.api.nvim_create_augroup("LspCodelens", { clear = true })
  end

  vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    group = codelens_group,
    callback = vim.lsp.codelens.refresh,
  })
  vim.g.lsp_codelens = true
  print("CodeLens enabled")
end

local function disable_codelens()
  vim.lsp.codelens.clear()

  if codelens_group then
    vim.api.nvim_clear_autocmds({ group = codelens_group })
  end

  vim.g.lsp_codelens = false
  print("CodeLens disabled")
end

local function toggle_codelens()
  if vim.g.lsp_codelens then
    disable_codelens()
  else
    enable_codelens()
  end
end

if vim.g.lsp_codelens then
  enable_codelens()
end

vim.keymap.set("n", "<leader>tl", toggle_codelens, { desc = "Toggle CodeLens" })
