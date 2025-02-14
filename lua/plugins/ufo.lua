MiniDeps.later(function()
  MiniDeps.add({
    source = 'kevinhwang91/nvim-ufo',
    depends = { 'kevinhwang91/promise-async' },
  })
  require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
      return {'treesitter', 'indent'}
    end
  })
end)
