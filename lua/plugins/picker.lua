return {
	{
		"nmfirdausw/mini.pick",
		event = "VeryLazy",
		keys = {
			{
				"<leader>.",
				function()
					MiniPick.builtin.files()
				end,
				desc = "Search file",
			},
			{
				"<leader>/",
				function()
					MiniPick.builtin.grep_live()
				end,
				desc = "Live grep",
			},
			{
				"<leader>b",
				function()
					MiniPick.builtin.buffers()
				end,
				desc = "Search buffer",
			},
		},
		opts = function()
			local pick = require("mini.pick")
			local icons = {
				directory = vim.g.icons and " " .. Icons.folder or " ◯ ",
				file = vim.g.icons and " " .. Icons.file or " 󰑊 ",
				none = " ",
			}
			local win_config = function()
				local height = vim.o.lines
				local width = vim.o.columns
				return {
					border = "rounded",
					height = vim.o.lines,
					width = vim.o.columns,
					row = math.floor(1 * (vim.o.lines - height)),
					col = math.floor(1 * (vim.o.columns - width)),
				}
			end
			return {
				window = {
					config = win_config,
					prompt_prefix = vim.g.icons and "  " or " / ",
				},
				source = {
					show = function(buf_id, items, query)
						return pick.default_show(
							buf_id,
							items,
							query,
							{
								show_icons = true,
								icons = { directory = icons.directory, file = icons.file, none = " " },
							}
						)
					end,
				},
			}
		end,
	},
	{
		"echasnovski/mini.visits",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.extra",
		event = "VeryLazy",
		keys = function()
			local keys = {
				{
					"<leader>e",
					function()
						MiniExtra.pickers.explorer()
					end,
					desc = "File explorer",
				},
				{
					"<leader>sd",
					function()
						MiniExtra.pickers.diagnostic()
					end,
					desc = "Diagnostics",
				},
				{
					"<leader>sh",
					function()
						MiniExtra.pickers.hl_groups()
					end,
					desc = "Highlights",
				},
				{
					"<leader>sb",
					function()
						MiniExtra.pickers.buf_lines()
					end,
					desc = "Buffer lines",
				},
				{
					"<leader>sC",
					function()
						MiniExtra.pickers.commands()
					end,
					desc = "Commands",
				},
				{
					"<leader>sc",
					function()
						MiniExtra.pickers.history()
					end,
					desc = "Command history",
				},
				{
					"<leader>sk",
					function()
						MiniExtra.pickers.keymaps()
					end,
					desc = "Keymaps",
				},
				{
					"<leader>sq",
					function()
						MiniExtra.pickers.list({ scope = "quickfix" })
					end,
					desc = "Quickfix list",
				},
				{
					"<leader>sl",
					function()
						MiniExtra.pickers.list({ scope = "location" })
					end,
					desc = "Location list",
				},
				{
					"<leader>sj",
					function()
						MiniExtra.pickers.list({ scope = "jump" })
					end,
					desc = "Jump list",
				},
				{
					"<leader>sm",
					function()
						MiniExtra.pickers.marks()
					end,
					desc = "Marks",
				},
				{
					"<leader>so",
					function()
						MiniExtra.pickers.oldfiles()
					end,
					desc = "Old files",
				},
				{
					"<leader>sO",
					function()
						MiniExtra.pickers.options()
					end,
					desc = "Old files",
				},
				{
					"<leader>sr",
					function()
						MiniExtra.pickers.registers()
					end,
					desc = "Registers",
				},
				{
					"<leader>sn",
					function()
						MiniExtra.pickers.treesitter()
					end,
					desc = "Nodes",
				},
				{
					"<leader>sv",
					function()
						MiniExtra.pickers.visit_paths()
					end,
					desc = "Visit paths",
				},
				{
					"<leader>sV",
					function()
						MiniExtra.pickers.visit_labels()
					end,
					desc = "Visit labels",
				},
			}
			if Utils.gitdir() then
				table.insert(keys, {
					"<leader>sgb",
					function()
						MiniExtra.pickers.git_branches()
					end,
					desc = "Branches",
				})
				table.insert(keys, {
					"<leader>sgc",
					function()
						MiniExtra.pickers.git_commits()
					end,
					desc = "Commits",
				})
				table.insert(keys, {
					"<leader>sgf",
					function()
						MiniExtra.pickers.git_files()
					end,
					desc = "Files",
				})
				table.insert(keys, {
					"<leader>sgh",
					function()
						MiniExtra.pickers.git_hunks()
					end,
					desc = "Hunks",
				})
			end
			return keys
		end,
		opts = {},
	},
}
