vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

local lines = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
local height = lines - math.floor(lines / 1.618)

_G.Utils = require("config.utils")
_G.MainWin = vim.api.nvim_get_current_win()

require("config.options")
require("config.neovide")
require("config.keymaps")
require("config.statuscolumn")
require("config.autocommands")
require("config.lazy")
