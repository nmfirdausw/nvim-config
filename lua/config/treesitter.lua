require("nvim-treesitter").install({
  "lua",
  "php",
  "html",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_config", { clear = true }),
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local has_parser = pcall(vim.treesitter.get_parser, buf)
    if not has_parser then
      return
    end
    vim.treesitter.start()

    local lang = vim.treesitter.get_parser(buf):lang()
    local has_folds_query = pcall(vim.treesitter.query.get, lang, "folds")
    local has_indents_query = pcall(vim.treesitter.query.get, lang, "indents")

    if has_folds_query then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end

    if has_indents_query then
      vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end
  end,
})

vim.keymap.set("n", "<leader>th", function()
  local buf = vim.api.nvim_get_current_buf()
  local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)

  if not lang or not pcall(vim.treesitter.language.add, lang) then
    return
  end

  if vim.treesitter.highlighter.active[buf] then
    vim.treesitter.stop(buf)
    vim.notify("Treesitter highlighting disabled for this buffer")
  else
    vim.treesitter.start(buf)
    vim.notify("Treesitter highlighting enabled for this buffer")
  end
end, { desc = "Toggle syntax highlighting" })
