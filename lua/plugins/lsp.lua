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

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function()
      if vim.g.inlay_hints_enable then
        vim.lsp.inlay_hint.enable()
      end
    end,
  })

  for server, opts in pairs(servers) do
    opts = vim.tbl_extend('force', {
      capabilities = vim.deepcopy(capabilities),
    }, opts)
    handlers[server] = function()
      lspconfig[server].setup(opts)
    end
  end

  require('mason-lspconfig').setup_handlers(handlers)

  local diagnostics = {
    virtual_text = {
      prefix = function(diagnostic)
        for severity, icon in pairs(Icons.virtual_text.diagnostics) do
          if diagnostic.severity == vim.diagnostic.severity[severity:upper()] then
            return icon
          end
        end
      end
    },
  }

  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = Icons.signs.diagnostics.error,
        [vim.diagnostic.severity.WARN] = Icons.signs.diagnostics.warn,
        [vim.diagnostic.severity.HINT] = Icons.signs.diagnostics.hint,
        [vim.diagnostic.severity.INFO] = Icons.signs.diagnostics.info,
      },
    },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    virtual_text = diagnostics.virtual_text,
  })

end)
