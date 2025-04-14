return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
		priority = 800,
		opts = {
			default = true,
		},
	},
	{
		"projekt0n/circles.nvim",
		lazy = false,
		priority = 700,
		cond = function()
			return vim.g.icons ~= true
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			icons = { empty = "󰑊", filled = "󰑊", lsp_prefix = "󰑊" },
			lsp = false,
		},
	},
}
