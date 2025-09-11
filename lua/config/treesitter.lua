local parsers = {
  "blade",
  "c_sharp",
  "css",
  "html",
  "lua",
  "luadoc",
  "luap",
  "php",
  "razor",
}

vim.filetype.add({
  extension = {
    razor = "razor",
    cshtml = "razor",
  },
})

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
