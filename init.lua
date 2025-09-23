_G.Utils = require("config.utils")

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

if Utils.is_git_dir() then
  require("config.gitsigns")
end

require("config.which-key")
