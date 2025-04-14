return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			no_overlap = true,
			col = 0,
			border = "rounded",
		},
		icons = {
			mappings = false,
		},
		spec = {
			{ "<leader>s", desc = "Search" },
			{ "<leader>i", desc = "Inspect" },
			{ "<leader>g", desc = "Git", cond = Utils.gitdir() },
			{ "<leader>gh", desc = "Hunk", cond = Utils.gitdir() },
		},
	},
}
