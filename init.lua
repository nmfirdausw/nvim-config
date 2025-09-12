vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

_G.Utils = require("config.utils")

require("config.options")
require("config.neovide")
require("config.keymaps")
require("config.diagnostics")
require("config.lazy")
