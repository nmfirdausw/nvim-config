-- ============================================================================
-- Options: Neovim configuration settings
-- ============================================================================
-- Custom vim options that configure the editor's behavior, appearance,
-- and functionality to improve the overall editing experience.

-- Global configuration
vim.g.mapleader = " "
vim.g.border = "rounded"
vim.g.auto_resize_splits = true
vim.g.splits_ratio = 0.618
vim.g.format_on_save = true

-- Indentation and formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- UI and appearance
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars:append({ eob = " ", foldopen = "-", foldclose = "+" })
vim.opt.guifont = { "ComicCodeLigatures Nerd Font", ":h14" }
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- Window and split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Code folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"

-- File handling and persistence
vim.opt.backup = false
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.writebackup = false
