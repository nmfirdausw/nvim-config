return {
	"saghen/blink.cmp",
	version = "*",
	event = { "VeryLazy" },
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"onsails/lspkind.nvim",
			opts = {},
		},
	},
	opts = function()
		return {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},
			sources = {
				default = { "lsp", "snippets", "path", "buffer" },
			},
			fuzzy = {
				sorts = {
					function(a, b)
						if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
							return
						end
						return b.client_name == "emmet_ls"
					end,
					"score",
					"sort_text",
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
										if string.sub(ctx.label, -1) == "/" then
											icon = "󰝰 "
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
										if string.sub(ctx.label, -1) == "/" then
											hl = "Directory"
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
				keymap = {
					preset = "inherit",
				},
				sources = function()
					local type = vim.fn.getcmdtype()
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					if type == ":" or type == "@" then
						return { "cmdline", "path", "buffer" }
					end
					return {}
				end,
				completion = {
					list = {
						selection = {
							preselect = false,
							auto_insert = false,
						},
					},
					menu = {
						auto_show = true,
					},
				},
			},
		}
	end,
}
