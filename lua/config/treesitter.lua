require("nvim-treesitter").install({
  "lua",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_config", { clear = true }),
  callback = function()
    vim.treesitter.start()

    local buf = vim.api.nvim_get_current_buf()
    local lang = vim.treesitter.get_parser(buf):lang()
    local has_folds_query = pcall(vim.treesitter.query.get, lang, 'folds')
    local has_indents_query = pcall(vim.treesitter.query.get, lang, 'indents')

    if has_folds_query then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end

    if has_indents_query then
      vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end

  end
})
