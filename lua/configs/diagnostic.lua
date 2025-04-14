vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = vim.g.icons and Icons.signs.diagnostics.error or "󰑊",
			[vim.diagnostic.severity.WARN] = vim.g.icons and Icons.signs.diagnostics.warn or "󰑊",
			[vim.diagnostic.severity.HINT] = vim.g.icons and Icons.signs.diagnostics.hint or "󰑊",
			[vim.diagnostic.severity.INFO] = vim.g.icons and Icons.signs.diagnostics.info or "󰑊",
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:i",
	callback = function()
		vim.diagnostic.config({
			virtual_text = {
				prefix = function(diagnostic)
					for severity, icon in pairs(Icons.virtual_text.diagnostics) do
						if diagnostic.severity == vim.diagnostic.severity[severity:upper()] then
							return icon
						end
					end
				end,
			},
			{
				current_line = true,
			},
			virtual_lines = false,
		})
	end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:n",
	callback = function()
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = {
				current_line = true,
			},
		})
	end,
})
