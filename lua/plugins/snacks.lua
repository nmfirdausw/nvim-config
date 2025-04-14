return {
	--FIXME: This plugin is not working as expected. It should be fixed.
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = {
			enabled = false,
			chunk = {
				enabled = true,
			},
		},
		quickfile = { enabled = true },
	},
}
