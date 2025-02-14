MiniDeps.now(function()
  MiniDeps.add({
    source = 'williamboman/mason.nvim',
  })

  require('mason').setup()

  MiniDeps.add({
    source = 'williamboman/mason-lspconfig.nvim',
  })

  require('mason-lspconfig').setup()

  MiniDeps.add({
    source = 'WhoIsSethDaniel/mason-tool-installer.nvim',
    depends = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MasonToolsUpdateCompleted',
    callback = function()
      vim.schedule(function()
        vim.cmd('LspStart')
      end)
    end,
  })

  require('mason-tool-installer').setup({
    auto_update = true,
    ensure_installed = {
      -- lsp
      'lua-language-server',
    }
  })
end)
