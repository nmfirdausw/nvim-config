MiniDeps.now(function()
  MiniDeps.add({
    source = 'folke/lazydev.nvim',
  })

  require('lazydev').setup({
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  })
end)
