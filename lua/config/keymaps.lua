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
})

-- Buffer keymaps
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>", { desc = "Delete buffer" })

-- System clipboard keymaps
vim.keymap.set("n", "<leader>y", "\"+yy", { desc = "Copy line to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy selection to clipboard" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from clipboard" })
