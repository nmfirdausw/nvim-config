_G.Utils = require("config.utils")

require("config.options")
require("config.dependencies")
require("config.keymaps")
require("config.formatting")
require("config.treesitter")

if Utils.is_git_dir() then
  require("config.git")
end

require("config.lsp")
require("config.diagnostics")
require("config.folding")
require("config.statuscolumn")
