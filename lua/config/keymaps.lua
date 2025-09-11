vim.g.mapleader = " "

vim.keymap.set("n", "<leader>y", "\"+yy", { desc = "Copy line to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy selection to clipboard" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from clipboard" })

vim.keymap.set("n", "<S-down>", "}")
vim.keymap.set("n", "<S-up>", "{")
vim.keymap.set("n", "<S-left>", "B")
vim.keymap.set("n", "<S-right>", "W")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
