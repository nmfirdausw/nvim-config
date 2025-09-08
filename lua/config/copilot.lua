vim.pack.add({ "https://github.com/zbirenbaum/copilot.lua" })

require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-a>",
      next = "<C-n>",
      prev = "<C-e>",
    },
  },
})
