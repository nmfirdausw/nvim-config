vim.g.icons = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.inlay_hints = false

-- Neovide config
if vim.g.neovide then
	vim.o.guifont = "ComicCodeLigatures Nerd Font:h16"
	vim.g.neovide_show_border = true
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_show_border = true
	vim.g.neovide_padding_left = 8
	vim.g.neovide_padding_top = 4
	vim.g.neovide_input_macos_option_key_is_meta = "both"
end

-- General
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.list = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.wrap = false

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- History
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.writebackup = false

-- Folding
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

