MiniDeps.now(function()
  MiniDeps.add({
    source = 'neovim/nvim-lspconfig',
    depends = {
      'saghen/blink.cmp',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
  })
  
  local servers = {

  }

  local lspconfig = require('lspconfig')
  local blink = require('blink.cmp')
  local capabilities = vim.tbl_deep_extend(
    'force',
    {},
    vim.lsp.protocol.make_client_capabilities(),
    blink.get_lsp_capabilities() or {}
  )
  local handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end,
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, opts)
    handlers[server] = function()
      lspconfig[server].setup(opts)
    end
  end

  require("mason-lspconfig").setup_handlers(handlers)
end)
