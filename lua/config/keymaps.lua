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
    { "<leader>b", desc = "Buffer" },
    { "<leader>[", desc = "Previous", cond = Utils.is_git_dir() },
    { "<leader>]", desc = "Next", cond = Utils.is_git_dir() },
    { "<leader>g", desc = "Git", cond = Utils.is_git_dir(), mode = { "n", "v" } },
    { "<leader>gb", desc = "Blame", cond = Utils.is_git_dir() },
    { "<leader>gd", desc = "Diff", cond = Utils.is_git_dir() },
    { "<leader>gh", desc = "Hunk", cond = Utils.is_git_dir() },
    { "<leader>tg", desc = "Git", cond = Utils.is_git_dir() },
  },
})

-- Buffer keymaps
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>", { desc = "Delete buffer" })

-- System clipboard keymaps
vim.keymap.set("n", "<leader>y", "\"+yy", { desc = "Copy line to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy selection to clipboard" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from clipboard" })
