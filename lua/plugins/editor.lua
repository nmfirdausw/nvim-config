return {
	{ "echasnovski/mini.ai", event = "VeryLazy", opts = {} },
	{ "echasnovski/mini.align", event = "VeryLazy", opts = {} },
	{ "echasnovski/mini.bracketed", event = "VeryLazy", opts = {} },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return vim.bo.commentstring
				end,
				ignore_blank_line = true,
			},
		},
	},
	{ "echasnovski/mini.cursorword", event = "VeryLazy", opts = {} },
	{ "echasnovski/mini.splitjoin", event = "VeryLazy", opts = {} },
	{ "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
	{
		"echasnovski/mini.trailspace",
		event = "VeryLazy",
		keys = {
			{
				"gs",
				function()
					MiniTrailspace.trim()
				end,
				desc = "Trim trailing whitespace",
			},
		},
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = false, terminal = false },
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
				[" "] = { action = "open", pair = "  ", neigh_pattern = "[^\\]." },
				["!"] = { action = "open", pair = "!!", neigh_pattern = "[^\\]." },
				["-"] = { action = "open", pair = "--", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
			},
			skip_next = [=[[%w%%%"%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		},
		config = function(_, opts)
			local pairs = require("mini.pairs")
			pairs.setup(opts)
			local open = pairs.open
			pairs.open = function(pair, neigh_pattern)
				if vim.fn.getcmdline() ~= "" then
					return open(pair, neigh_pattern)
				end
				local o, c = pair:sub(1, 1), pair:sub(2, 2)
				local line = vim.api.nvim_get_current_line()
				local cursor = vim.api.nvim_win_get_cursor(0)
				local next = line:sub(cursor[2] + 1, cursor[2] + 1)
				local before = line:sub(1, cursor[2])
				local before_before = line:sub(cursor[2] - 1, cursor[2] - 1)
				local next_next = line:sub(cursor[2] + 2, cursor[2] + 2)
				local skip_next = opts.skip_next

				if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
					return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
				end

				if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
					return o
				end

				if opts.skip_ts and #opts.skip_ts > 0 then
					local ok, captures =
						pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
					for _, capture in ipairs(ok and captures or {}) do
						if vim.tbl_contains(opts.skip_ts, capture.capture) then
							return o
						end
					end
				end
				if opts.skip_unbalanced and next == c and c ~= o then
					local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
					local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
					if count_close > count_open then
						return o
					end
				end

				if o == " " then
					if before:match("[{!-]") and next:match("[-!}]") then
						return open(pair, neigh_pattern)
					end
					return o
				end

				if o == "-" then
					if before:match("[{]") and next:match("[}]") then
						return open(pair, neigh_pattern)
					elseif before:match("[-]") and next:match("[-]") then
						if before_before:match("[{]") and next_next:match("[}]") then
							return open(pair, neigh_pattern)
						end
					end
					return o
				end

				if o == "!" then
					if before:match("[{]") and next:match("[}]") then
						return open(pair, neigh_pattern)
					elseif before:match("[!]") and next:match("[!]") then
						if before_before:match("[{]") and next_next:match("[}]") then
							return open(pair, neigh_pattern)
						end
					end
					return o
				end

				return open(pair, neigh_pattern)
			end
		end,
	},
	{
		"echasnovski/mini.move",
		event = "VeryLazy",
		opts = {
			mappings = {
				left = "<M-m>",
				right = "<M-i>",
				down = "<M-n>",
				up = "<M-e>",
				line_left = "<M-m>",
				line_right = "<M-i>",
				line_down = "<M-n>",
				line_up = "<M-e>",
			},
		},
	},
}
