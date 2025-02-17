MiniDeps.now(function()
  MiniDeps.add({
    source = 'nvim-tree/nvim-web-devicons',
  })

  require('nvim-web-devicons').setup({
    default = true,
  })

  if not vim.g.icons then
    MiniDeps.add({
      source = 'projekt0n/circles.nvim',
      depends = { 'kyazdani42/nvim-web-devicons' },
    })

    require('circles').setup({
      icons = { empty = ' 󰑊', filled = ' 󰑊', lsp_prefix = ' 󰑊' },
      lsp = false,
    })
  end
end)
