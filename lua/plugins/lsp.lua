return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
      },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
          ui = {
            border = "rounded",
            height = 0.8,
          },
        },
      },
    },
    lazy = false,
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        -- lsp
        "css-lsp",
        "emmet-ls",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "html-lsp",
        "intelephense",
        "json-lsp",
        "lua-language-server",
        "python-lsp-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        -- linter
        "duster",
        "tlint",
        "phpstan",
        "phpcs",
        -- formatter
        "blade-formatter",
        "stylua",
        "shfmt",
        "biome",
        "duster",
        "pint",
        "yamlfmt",
        "php-cs-fixer",
        -- dap
        "php-debug-adapter",
      },
      auto_update = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    opts = function()
      return {
        diagnostics = {
          underline = true,
          update_in_insert = true,
          virtual_text = {
            spacing = 4,
            source = "if_many",
          },
        },
        servers = {
          emmet_ls = {
            filetypes = {
              'blade',
              'html',
              'css',
            },
          },
          html = {
            filetypes = {
              'blade.html.php',
              'blade',
              'html',
            },
          },
          jsonls = {
            settings = {
              json = {
                schemas = require('schemastore').json.schemas(),
                validate = {
                  enable = true,
                },
              },
            },
          },
          tailwindcss = {
            filetypes = {
              'blade',
              'html',
              'css',
            },
            settings = {
              tailwindCSS = {
                emmetCompletions = true,
                experimental = {
                  classRegex = false,
                },
                classAttributes = {
                  'class',
                  '@class',
                  'className',
                  'classList',
                },
              },
            },
            ts_ls = {
              filetypes = {
                'typescript',
                'javascript',
                'json',
                'blade',
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local blink = require("blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
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

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function()
          if vim.g.inlay_hint then
            vim.lsp.inlay_hint.enable()
          end
        end,
      })

      for server, server_opts in pairs(opts.servers) do
        opts = vim.tbl_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, server_opts)
        handlers[server] = function()
          lspconfig[server].setup(server_opts)
        end
      end

      require("mason-lspconfig").setup_handlers(handlers)

      local icons = {}

      if vim.g.icons then
        icons = {
          signs = {
            diagnostics = {
              error = Icons.signs.diagnostics.error,
              warn = Icons.signs.diagnostics.warn,
              hint = Icons.signs.diagnostics.hint,
              info = Icons.signs.diagnostics.info,
            },
          },
        }
      else
        icons = {
          signs = {
            diagnostics = {
              error = "󰑊",
              warn = "󰑊",
              hint = "󰑊",
              info = "󰑊",
            },
          },
        }
      end

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
            [vim.diagnostic.severity.ERROR] = icons.signs.diagnostics.error,
            [vim.diagnostic.severity.WARN] = icons.signs.diagnostics.warn,
            [vim.diagnostic.severity.HINT] = icons.signs.diagnostics.hint,
            [vim.diagnostic.severity.INFO] = icons.signs.diagnostics.info,
          },
        },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        virtual_text = diagnostics.virtual_text,
      })
    end
  }
}
