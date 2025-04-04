return {
  "cdmill/focus.nvim",
  event = "VeryLazy",
  cmd = "Focus",
  keys = {
    { "<leader>z", ":Focus<cr>", silent = true, desc = "Zen mode" },
  },
  opts = {
    window = {
      backdrop = 1,
      width = 100,
      height = 1,
      options = {
        number = true
      },
    },
  }
}
