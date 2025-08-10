vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  notifier = {
    enabled = true,
    icons = {
      error = "x",
      warn = "!",
      info = "i",
      debug = "*",
      trace = "?",
    },
  },
})
