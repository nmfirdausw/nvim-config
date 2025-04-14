return {
	"rebelot/heirline.nvim",
	lazy = false,
	priority = 600,
	opts = function()
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		local colors = {
			fg1 = utils.get_highlight("Variable").fg,
			fg2 = utils.get_highlight("String").fg,
			fg3 = utils.get_highlight("Identifier").fg,
			fg4 = utils.get_highlight("Delimiter").fg,
			fg5 = utils.get_highlight("Comment").fg,
			bg1 = utils.get_highlight("Normal").bg,
			bg2 = utils.get_highlight("StatusLine").bg,
			bg3 = utils.get_highlight("StatusLineNC").bg,
			bg4 = utils.get_highlight("StatusLine").bg,
			bg5 = utils.get_highlight("StatusLineNC").bg,
			diag_error = utils.get_highlight("DiagnosticError").fg,
			diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			diag_info = utils.get_highlight("DiagnosticInfo").fg,
			diag_hint = utils.get_highlight("DiagnosticHint").fg,
			diag_ok = utils.get_highlight("DiagnosticOk").fg,
			git_add = utils.get_highlight("Added").fg,
			git_change = utils.get_highlight("Changed").fg,
			git_delete = utils.get_highlight("Removed").fg,
		}

		require("heirline").load_colors(colors)

		local mode_colors = {
			n = colors.fg1,
			i = colors.fg1,
			v = colors.fg4,
			V = colors.fg4,
			["\22"] = colors.fg4,
			["\22s"] = colors.fg4,
			c = colors.diag_error,
			s = colors.diag_warn,
			S = colors.diag_warn,
			["\19"] = colors.diag_warn,
			R = colors.diag_info,
			r = colors.diag_info,
			["!"] = colors.diag_info,
			t = colors.diag_hint,
		}

		local mode_names = {
			n = "N ",
			no = "N?",
			nov = "N?",
			noV = "N?",
			["no\22"] = "N?",
			niI = "Ni",
			niR = "Nr",
			niV = "Nv",
			nt = "Nt",
			v = "V ",
			vs = "Vs",
			V = "V_",
			Vs = "Vs",
			["\22"] = "^V",
			["\22s"] = "^V",
			s = "S ",
			S = "S_",
			["\19"] = "^S",
			i = "I ",
			ic = "Ic",
			ix = "Ix",
			R = "R ",
			Rc = "Rc",
			Rx = "Rx",
			Rv = "Rv",
			Rvc = "Rv",
			Rvx = "Rv",
			c = "C ",
			cv = "Ex",
			r = "..",
			rm = "M ",
			["r?"] = "? ",
			["!"] = "! ",
			t = "T ",
		}

		local function pathshorten(path)
			local parts = {}
			for part in string.gmatch(path, "([^/]+)") do
				table.insert(parts, part)
			end

			local shortened_parts = {}
			for i = 1, #parts - 1 do
				table.insert(shortened_parts, parts[i]:sub(1, 1))
			end

			table.insert(shortened_parts, parts[#parts])

			return "/" .. table.concat(shortened_parts, "/")
		end

		local align = { provider = "%=" }

		local space = { provider = " " }

		local vi_mode = {
			init = function(self)
				self.mode = vim.fn.mode(1)
			end,
			provider = function(self)
				return mode_names[self.mode]
			end,
			hl = function(self)
				local mode = self.mode:sub(1, 1)
				return { fg = mode_colors[mode], bold = true }
			end,
			update = {
				"ModeChanged",
				pattern = "*:*",
				callback = vim.schedule_wrap(function()
					vim.cmd("redrawstatus")
				end),
			},
		}

		local filename = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
			provider = function(self)
				local fname = vim.fn.fnamemodify(self.filename, ":.")
				if fname == "" then
					return "[No Name] "
				end
				fname = vim.fn.fnamemodify(fname, ":t")
				if fname == "" then
					return ""
				else
					return fname .. " "
				end
			end,
			hl = function()
				if vim.bo.modified then
					return { fg = colors.fg1, force = true }
				else
					if not vim.bo.modifiable or vim.bo.readonly then
						return { fg = colors.fg3 }
					else
						return { fg = colors.fg1 }
					end
				end
			end,
		}

		local path = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
			provider = function(self)
				local path = vim.fn.expand("%:.")
				local fname = vim.fn.fnamemodify(self.filename, ":t")
				if fname == path then
					return ""
				else
					path = vim.fn.fnamemodify(path, ":h")
					if not conditions.width_percent_below(#path, 0.25) then
						path = pathshorten(path)
					end
					return path .. "/"
				end
			end,
			hl = { fg = colors.fg3 },
		}

		local file_icon = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
				local extension = vim.fn.fnamemodify(self.filename, ":e")
				if self.filename then
					self.icon, self.icon_color =
						require("nvim-web-devicons").get_icon_color(self.filename, extension, { default = true })
				else
					self.icon = vim.g.icons and Icons.file:gsub("%s+$", "") or "󰑊"
					self.icon_color = "#111111"
				end
			end,
			provider = function(self)
				local pth = vim.fn.expand("%:.")
				local fname = vim.fn.fnamemodify(self.filename, ":t")
				if fname == pth then
					pth = ""
				end
				if vim.fn.fnamemodify(self.filename, ":t") == "" then
					if pth == "" then
						return vim.g.icons and Icons.file:gsub("%s+$", "") or "󰑊"
					else
						return vim.g.icons and Icons.folder:gsub("%s+$", "") or "○"
					end
				else
					return self.icon and self.icon
				end
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local file_flag = {
			{
				init = function(self)
					self.filename = vim.api.nvim_buf_get_name(0)
				end,
				condition = function()
					return not vim.bo.modifiable or vim.bo.readonly
				end,
				provider = function(self)
					local fname = vim.fn.fnamemodify(self.filename, ":.")
					fname = vim.fn.fnamemodify(fname, ":t")
					if fname == "" then
						return ""
					else
						return "󰍁"
					end
				end,
				hl = { fg = colors.fg3 },
			},
		}

		local search_count = {
			condition = function()
				return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
			end,
			init = function(self)
				local ok, search = pcall(vim.fn.searchcount)
				if ok and search.total then
					self.search = search
				end
			end,
			provider = function(self)
				local search = self.search
				local target = vim.fn.getreg("/")
				local search_forward = vim.v.searchforward == 1
				local search_forward_icons = vim.g.icons and Icons.statusline.search_forward or "/"
				local search_backward_icons = vim.g.icons and Icons.statusline.search_backward or "?"
				if search then
					if search_forward then
						return search_forward_icons
							.. target
							.. string.format(" [%d/%d]", search.current, math.min(search.total, search.maxcount))
					else
						return search_backward_icons
							.. target
							.. string.format(" [%d/%d]", search.current, math.min(search.total, search.maxcount))
					end
				else
					return ""
				end
			end,
		}

		local macro_rec = {
			condition = function()
				return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
			end,
			provider = vim.g.icons and Icons.statusline.recording .. " @" or "recording @",
			{
				provider = function()
					return vim.fn.reg_recording()
				end,
			},
			update = {
				"RecordingEnter",
				"RecordingLeave",
			},
		}

		local git_branch = {
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,
			{
				provider = function(self)
					if self.status_dict.head then
						return " " .. self.status_dict.head .. "  "
					else
						return ""
					end
				end,
				hl = { fg = colors.fg1 },
			},
		}

		local git_status = {
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,
			{
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and ("+" .. count .. " ")
				end,
				hl = { fg = colors.git_add },
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and ("~" .. count .. " ")
				end,
				hl = { fg = colors.git_change },
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and ("-" .. count .. " ")
				end,
				hl = { fg = colors.git_delete },
			},
		}

		local active_lsp = {
			condition = conditions.lsp_attached,
			update = { "LspAttach", "LspDetach" },

			provider = function()
				local names = {}
				for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
					table.insert(names, server.name)
				end
				return "[" .. table.concat(names, ", ") .. "]"
			end,
			hl = { fg = colors.fg1 },
		}

		local diagnostics = {
			condition = conditions.has_diagnostics,
			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,
			update = { "DiagnosticChanged", "BufEnter" },
			{
				provider = function(self)
					return self.errors > 0
						and ((vim.g.icons and Icons.signs.diagnostics.error or "") .. self.errors .. " ")
				end,
				hl = { fg = colors.diag_error },
			},
			{
				provider = function(self)
					return self.warnings > 0
						and ((vim.g.icons and Icons.signs.diagnostics.warn or "") .. self.warnings .. " ")
				end,
				hl = { fg = colors.diag_warn },
			},
			{
				provider = function(self)
					return self.info > 0
						and ((vim.g.icons and Icons.signs.diagnostics.info or "") .. self.info .. " ")
				end,
				hl = { fg = colors.diag_info },
			},
			{
				provider = function(self)
					return self.hints > 0
						and ((vim.g.icons and Icons.signs.diagnostics.hint or "") .. self.hints .. " ")
				end,
				hl = { fg = colors.diag_hint },
			},
		}

		local ruler = {
			init = function(self)
				self.mode = vim.fn.mode(1) -- :h mode()
			end,
			provider = " " .. Icons.statusline.ruler .. "%3(%P%) %3(%l%) %3(%c%)",
			hl = function(self)
				local mode = self.mode:sub(1, 1)
				return { fg = mode_colors[mode] }
			end,
		}

		return {
			statusline = {
				vi_mode,
				space,
				git_branch,
				file_icon,
				space,
				path,
				filename,
				file_flag,
				space,
				git_status,
				align,
				macro_rec,
				search_count,
				align,
				diagnostics,
				space,
				active_lsp,
				space,
				ruler,
			},
		}
	end,
}
