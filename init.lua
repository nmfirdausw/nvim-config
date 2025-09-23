vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

_G.Utils = require("config.utils")
_G.MainWin = vim.api.nvim_get_current_win()

require("config.options")
require("config.keymaps")
require("config.statuscolumn")
require("config.plugins")
require("config.treesitter")
require("config.mason")
require("config.lsp")
require("config.diagnostic")
require("config.copilot")
require("config.tiny-inline-diagnostic")
require("config.conform")
require("config.mini-ai")
require("config.blink-cmp")
require("config.blink-pairs")
require("config.autocmds")
require("config.snacks")
require("config.ufo")
require("config.indent")

if Utils.is_git_dir() then
  require("config.gitsigns")
end

require("config.which-key")
