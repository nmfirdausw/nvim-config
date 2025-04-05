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
		ensure_installed = {
			"bash",
			"blade",
			"c",
			"css",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"php_only",
			"phpdoc",
			"query",
			"scheme",
			"sql",
			"twig",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
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
				node_incremental = "<C-i>",
				scope_incremental = false,
				node_decremental = "<C-d>",
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
				branch = "main",
				generate_requires_npm = true,
				requires_generate_from_grammar = true,
			},
			filetype = "blade",
		}

		require("nvim-treesitter.configs").setup(opts)

		vim.keymap.set("n", "<leader>it", vim.treesitter.inspect_tree)
		vim.keymap.set("n", "<leader>i", vim.show_pos)
	end,
	dependencies = {
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
		"LiadOz/nvim-dap-repl-highlights",
	},
}
