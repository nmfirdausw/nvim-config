require('config.options')

_G.Utils = require("utils")

local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd("echo 'Installing `mini.nvim`' | redraw")
  local clone_cmd = {
    "git", "clone", "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim", mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
end

require("mini.deps").setup({ path = { package = path_package } })

local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/"

for _, plugin_file in ipairs(vim.fn.readdir(plugin_dir)) do
  if plugin_file:match(".*.lua$") then
    local plugin_name = plugin_file:sub(1, -5)
    require("plugins." .. plugin_name)
  end
end
