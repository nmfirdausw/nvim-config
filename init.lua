_G.Utils = require("utils")
_G.Icons = require("configs.icons")

vim.opt.rtp:append("/opt/homebrew/opt/fzf")

require("configs.options")

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

vim.api.nvim_set_hl(0, "Normal", {})
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#222222" })
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#333333" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#FFFFFF" })

local cmdheight = vim.opt.cmdheight
vim.opt.cmdheight = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=main", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  ui = {
    border = "single",
  },
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false,
  },
  install = { colorscheme = { "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.opt.cmdheight = cmdheight

require("configs.keymaps")
require("configs.autocmds")

