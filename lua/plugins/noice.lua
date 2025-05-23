return {
	"folke/noice.nvim",
	lazy = false,
	priority = 900,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>n", "", desc = "+Noice" },
		{ "<leader>il", ":lua require('noice.lsp').hover()<CR>", desc = "LSP Hover" },
		{ "K", ":lua require('noice.lsp').hover()<CR>", desc = "LSP Hover" },
		{
			"<leader>ns",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice Last Message",
		},
		{
			"<leader>nS",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice Last Message",
		},
		{
			"<S-Enter>",
			function()
				require("noice").redirect(vim.fn.getcmdline())
			end,
			mode = "c",
			desc = "Redirect Cmdline",
		},
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice Last Message",
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice History",
		},
		{
			"<leader>na",
			function()
				require("noice").cmd("all")
			end,
			desc = "Noice All",
		},
		{
			"<leader>nd",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "Dismiss All",
		},
		{
			"<leader>nt",
			function()
				require("noice").cmd("pick")
			end,
			desc = "Noice Picker (Telescope/FzfLua)",
		},
		{
			"<c-f>",
			function()
				if not require("noice.lsp").scroll(4) then
					return "<c-f>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll Forward",
			mode = { "i", "n", "s" },
		},
		{
			"<c-b>",
			function()
				if not require("noice.lsp").scroll(-4) then
					return "<c-b>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll Backward",
			mode = { "i", "n", "s" },
		},
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		cmdline = {
			enabled = true,
			view = "cmdline",
			opts = {},
			format = {
				cmdline = { pattern = "^:", icon = vim.g.icons and "" or ":", lang = "vim" },
				search_down = {
					kind = "search",
					pattern = "^/",
					icon = vim.g.icons and " " or "/",
					lang = "regex",
				},
				search_up = {
					kind = "search",
					pattern = "^%?",
					icon = vim.g.icons and " " or "?",
					lang = "regex",
				},
				filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
			},
		},
		views = {
			cmdline_input = {
				view = "cmdline",
				border = {
					style = "rounded",
				},
			},
			confirm = {
				position = {
					row = "50%",
					col = "50%",
				},
				border = {
					style = "single",
				},
				win_options = {
					wrap = true,
					linebreak = true,
				},
			},
		},
		format = {
			level = {
				icons = {
					error = vim.g.icons and Icons.signs.diagnostics.error or "󰑊",
					warn = vim.g.icons and Icons.signs.diagnostics.warn or "󰑊",
					info = vim.g.icons and Icons.signs.diagnostics.info or "󰑊",
				},
			},
		},
	},
	config = function(_, opts)
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
	end,
}
