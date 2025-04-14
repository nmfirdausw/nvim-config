return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local keys = {
			{
				"H",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon File",
			},
			{
				"h",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Quick Menu",
			},
			{
				"hl",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon to File 1",
			},
			{
				"hy",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon to File 2",
			},
			{
				"hp",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon to File 3",
			},
			{
				"hi",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Harpoon previous",
			},
			{
				"ha",
				function()
					require("harpoon"):list():next()
				end,
				desc = "Harpoon next",
			},
		}
		for i = 1, 5 do
			table.insert(keys, {
				"<leader>" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
				desc = "Harpoon to File " .. i,
			})
		end
		return keys
	end,
}
