vim.keymap.set("n", "<C-c>", "\"+yy", { desc = "Copy line to clipboard" })
vim.keymap.set("v", "<C-c>", "\"+y", { desc = "Copy to clipboard" })

vim.keymap.set("n", "<S-down>", "}")
vim.keymap.set("n", "<S-up>", "{")
vim.keymap.set("n", "<S-left>", "b")
vim.keymap.set("n", "<S-right>", "w")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
