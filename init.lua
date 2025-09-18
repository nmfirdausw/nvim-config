vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

_G.Utils = require("config.utils")
_G.MainWin = vim.api.nvim_get_current_win()
_G.PickerPosV = vim.opt.columns:get()
_G.PickerPosH = vim.opt.lines:get()
_G.PickerGoldenV = true
_G.PickerGoldenH = true

require("config.options")
require("config.neovide")
require("config.keymaps")
require("config.statuscolumn")
require("config.autocommands")
require("config.lazy")
