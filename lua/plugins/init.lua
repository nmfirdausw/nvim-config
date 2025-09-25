vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/kevinhwang91/promise-async",
  "https://github.com/kevinhwang91/nvim-ufo",
  "https://github.com/nvim-mini/mini.ai",
  { src = "https://github.com/Saghen/blink.cmp", version = "main" },
  { src = "https://github.com/Saghen/blink.pairs", version = "main" },
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/folke/snacks.nvim",
}, {
  confirm = false,
  load = function(plugin)
    local utils = require("config.utils")
    require("plugins." .. utils.trim_plugin_name(plugin.spec.name))
  end,
})
