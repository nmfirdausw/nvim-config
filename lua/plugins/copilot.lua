return {
	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		build = ":Copilot auth",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-a>",
					next = "<C-n>",
					prev = "<C-e>",
				},
			},
		},
	},
}
