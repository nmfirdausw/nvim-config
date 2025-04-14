return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<C-i>", desc = "Init or Increment selection" },
		{ "<C-d>", desc = "Decrement selection", mode = "x" },
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	opts = {
		auto_install = true,
		indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "php", "json", "blade" },
		},
		autotag = {
			enable = true,
		},
		endwise = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-i>",
				node_incremental = "v",
				scope_incremental = false,
				node_decremental = "V",
			},
		},
	},
	config = function(_, opts)
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade.git",
				files = {
					"src/parser.c",
				},
				branch = "tree-sitter-upgrade-dev",
			},
			filetype = "blade",
		}

		require("nvim-treesitter.configs").setup(opts)

		vim.keymap.set("n", "<leader>it", vim.treesitter.inspect_tree, { desc = "Syntax tree" })
		vim.keymap.set("n", "<leader>ih", vim.show_pos, { desc = "Highlight" })
	end,
	dependencies = {
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
		"LiadOz/nvim-dap-repl-highlights",
	},
}
