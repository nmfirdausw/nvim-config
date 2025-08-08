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
    { "<leader>g", desc = "Git", cond = Utils.is_git_dir() },
    { "<leader>gb", desc = "Blame", cond = Utils.is_git_dir() },
    { "<leader>gd", desc = "Diff", cond = Utils.is_git_dir() },
    { "<leader>gh", desc = "Hunk", cond = Utils.is_git_dir() },
    { "<leader>tg", desc = "Git", cond = Utils.is_git_dir() },
  },
})
