return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    win = {
      no_overlap = true,
      col = 0,
      border = "rounded",
    },
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>s", desc = "Search" },
    },
  }
}
