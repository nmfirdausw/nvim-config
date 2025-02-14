MiniDeps.now(function()
  MiniDeps.add({
    source = 'nvim-tree/nvim-web-devicons',
  })

  if not Icons.devicons then
    MiniDeps.add({
      source = 'projekt0n/circles.nvim',
      depends = { 'kyazdani42/nvim-web-devicons' },
    })

    require('circles').setup({
      icons = { empty = Icons.file, filled = Icons.file, lsp_prefix = Icons.file },
      lsp = false,
    })
  end
end)
