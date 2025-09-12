-- Global options
vim.g.border = "rounded"
vim.g.format_on_save = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Visual and display
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.fillchars:append({ eob = " " })
vim.opt.guifont = { "ComicCodeLigatures Nerd Font", ":h14" }
vim.opt.laststatus = 3
vim.opt.wrap = false

-- Behaviour
vim.opt.splitright = true
vim.opt.splitbelow = true

-- History and backup
vim.opt.backup = false
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.writebackup = false
