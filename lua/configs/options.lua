-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

if vim.g.neovide then
  vim.o.guifont = 'ComicCodeLigatures Nerd Font:h16'
  vim.g.neovide_show_border = true
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_show_border = true
  vim.g.neovide_padding_left = 8
  vim.g.neovide_padding_top = 4
  vim.g.neovide_input_macos_option_key_is_meta = 'both'
end

-- Runtime options
vim.opt.rtp:append('/opt/homebrew/opt/fzf')

-- General
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.conceallevel = 2
vim.opt.confirm = true
vim.opt.formatoptions = 'jcroqlnt'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.jumpoptions = 'view'
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.ruler = false
vim.opt.scrolloff = 4
vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.spelllang = { 'en' }
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = vim.g.vscode and 1000 or 300
vim.opt.updatetime = 200
vim.opt.virtualedit = 'block'
vim.opt.wildmode = 'longest:full,full'
vim.opt.winminwidth = 5
vim.opt.wrap = false

-- Completion
vim.opt.pumblend = 10
vim.opt.pumheight = 15
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Global options
vim.g.inlay_hints_enable = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2

-- Foldign
vim.opt.foldcolumn = '1'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Cursor options
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor'

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

vim.opt.fillchars:append({ eob = '~' })

