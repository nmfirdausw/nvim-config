vim.g.mapleader = " "

vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
  preset = "helix",
  win = {
    no_overlap = true,
    col = 0,
    border = vim.g.border,
  },
  icons = {
    mappings = false,
  },
  spec = {
    { "<leader>t", desc = "Toggle" },
  },
})
