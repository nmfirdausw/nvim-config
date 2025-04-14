return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"gF",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "biome" },
			json = { "biome" },
			jsonc = { "biome" },
			css = { "biome" },
			blade = { "blade-formatter", "duster" },
			php = { "duster" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = { timeout_ms = 2000 },
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
			biome = {
				require_cwd = true,
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
