vim.g.mapleader = " "

vim.keymap.set("n", "y", "\"+y", { desc = "Yank" })
vim.keymap.set("v", "y", "\"+y", { desc = "Yank" })
vim.keymap.set("n", "Y", "\"+Y", { desc = "Yank line" })

vim.keymap.set("n", "p", "\"+p", { desc = "Paste" })
vim.keymap.set("v", "p", "\"+p", { desc = "Paste" })
vim.keymap.set("n", "P", "\"+P", { desc = "Paste before" })
vim.keymap.set("v", "P", "\"+P", { desc = "Paste before" })

vim.keymap.set("n", "<C-c>", "\"+yy", { desc = "Copy line to clipboard" })
vim.keymap.set("v", "<C-c>", "\"+y", { desc = "Copy to clipboard" })

vim.keymap.set("n", "<S-down>", "}")
vim.keymap.set("n", "<S-up>", "{")
vim.keymap.set("n", "<S-left>", "b")
vim.keymap.set("n", "<S-right>", "w")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
