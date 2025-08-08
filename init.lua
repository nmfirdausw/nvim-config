_G.Utils = require("config.utils")

require("config.options")
require("config.dependencies")
require("config.keymaps")
require("config.formatting")
require("config.treesitter")
require("config.lsp")

if Utils.is_git_dir() then
  require("config.git")
end

require("config.folding")
require("config.statuscolumn")
