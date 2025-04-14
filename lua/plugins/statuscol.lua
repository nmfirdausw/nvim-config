return {
	"luukvbaal/statuscol.nvim",
	lazy = false,
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = true,
			segments = {
				{
					sign = {
						name = { ".*" },
						namespace = { ".*" },
						maxwidth = 1,
						colwidth = 1,
						auto = false,
						fillchar = Icons.signs.fillchar,
					},
					click = "v:lua.ScSa",
				},
				{ text = { " " } },
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
				{ text = { " " } },
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ text = { " " }, condition = { vim.bo.filetype ~= "oil" } },
			},
		}
	end,
}
