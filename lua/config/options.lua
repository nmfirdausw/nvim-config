-- Global config options
vim.g.mapleader = " "
vim.g.border = "rounded"
vim.g.format_on_save = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Visual and display
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars:append({ eob = " ", foldopen = "-", foldclose = "+" })
vim.opt.guifont = { "ComicCodeLigatures Nerd Font", ":h14" }
vim.opt.laststatus = 3
vim.opt.winheight = 5
vim.opt.winminheight = 5
vim.opt.winminwidth = 10
vim.opt.wrap = false

-- Behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- History and backup
vim.opt.backup = false
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.writebackup = false
