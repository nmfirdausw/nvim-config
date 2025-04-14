return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePost" },
	config = function()
		local lspconfig = require("lspconfig")
		local blink = require("blink.cmp")
		local servers = require("configs.lsp")

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				vim.keymap.set(
					"n",
					"gd",
					"<cmd>lua vim.lsp.buf.definition()<cr>",
					{ desc = "Goto definition", buffer = event.buf }
				)
				vim.keymap.set(
					"n",
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<cr>",
					{ desc = "Goto declaration", buffer = event.buf }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<cr>",
					{ desc = "Goto implementation", buffer = event.buf }
				)
				vim.keymap.set(
					"n",
					"go",
					"<cmd>lua vim.lsp.buf.type_definition()<cr>",
					{ desc = "Goto type definition", buffer = event.buf }
				)
				vim.keymap.set(
					"n",
					"gr",
					"<cmd>lua vim.lsp.buf.references()<cr>",
					{ desc = "Goto references", buffer = event.buf }
				)
				vim.keymap.set(
					"n",
					"gs",
					"<cmd>lua vim.lsp.buf.signature_help()<cr>",
					{ desc = "Signature help", buffer = event.buf }
				)
				vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename", buffer = event.buf })
				vim.keymap.set(
					"n",
					"ga",
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					{ desc = "Code action", buffer = event.buf }
				)
			end,
		})

		for server, server_opts in pairs(servers) do
			server_opts.capabilities = blink.get_lsp_capabilities(server_opts.capabilities or {})
			server_opts.handlers = vim.tbl_deep_extend("force", handlers, server_opts.handlers or {})
			lspconfig[server].setup(server_opts)
		end
	end,
}
