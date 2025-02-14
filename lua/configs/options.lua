-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Runtime options
vim.opt.rtp:append('/opt/homebrew/opt/fzf')

-- General
vim.opt.clipboard = "unnamedplus"

-- Global options
vim.g.inlay_hints_enable = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2

-- Foldign
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Cursor options
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"

-- Line numbers
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true

-- History
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.writebackup = false

vim.opt.fillchars:append({ eob = "~" })

