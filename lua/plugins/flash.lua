return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>f", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x", "o" } },
    { "<leader>v", function() require("flash").treesister() end, desc = "Flash Treesitter", mode = { "n", "x", "o" } },
  },
  opts = {},
}
