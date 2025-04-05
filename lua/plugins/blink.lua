return {
  "saghen/blink.cmp",
  version = "*",
  -- build = "cargo build --release",
  event = { "VeryLazy" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    {
      "onsails/lspkind.nvim",
      opts = {
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      }
    },
  },
  opts = function()
    return {
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            fallbacks = { "lazydev" },
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description" },
              { "source_name" },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local lspkind = require("lspkind")
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                        icon = dev_icon
                    end
                  elseif require("blink.cmp.sources.lsp.hacks.tailwind").get_hex_color(ctx.item) then
                    return Icons.lsp.kinds.tailwind_color
                  else
                    icon = lspkind.symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = "BlinkCmpKind" .. ctx.kind
                  if require("blink.cmp.sources.lsp.hacks.tailwind").get_hex_color(ctx.item) then
                    hl = ctx.kind_hl
                  end
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = { border = "rounded" },
        },
      },
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
      cmdline = {
        enabled = true,
        keymap = nil,
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == "/" or type == "?" then return { "buffer" } end
          if type == ":" or type == "@" then
            return { "cmdline", "path", "buffer" }
          end
          return {}
        end,
        completion = {
          menu = {
            draw = {
              columns = { { "kind_icon", "label" } },
            },
          },
        },
      },
    }
  end
}
