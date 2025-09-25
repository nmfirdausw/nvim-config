local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin_path .. ":" .. vim.env.PATH

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.diagnostics")
require("config.statuscolumn")
require("config.indent")
require("plugins")
