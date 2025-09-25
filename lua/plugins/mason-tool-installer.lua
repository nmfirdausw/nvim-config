local commands = {
  "MasonToolsClean",
  "MasonToolsInstall",
  "MasonToolsInstallSync",
  "MasonToolsUpdate",
  "MasonToolsUpdateSync",
}

local setup = function()
  for _, command in ipairs(commands) do
    vim.api.nvim_del_user_command(command)
  end
  vim.cmd("LoadMason")
  vim.cmd.packadd("mason-tool-installer.nvim")
  local lsp = require("config.lsp").install
  local formatters = require("config.formatters").install

  local tools = vim.list_extend({}, lsp)
  vim.list_extend(tools, formatters)

  require("mason-tool-installer").setup({
    ensure_installed = tools,
    auto_update = false,
    run_on_start = false,
  })
end

for _, command in ipairs(commands) do
  vim.api.nvim_create_user_command(command, function(opts)
    setup()
    if opts.args ~= "" then
      vim.cmd(command .. " " .. opts.args)
    else
      vim.cmd(command)
    end
  end, {
    nargs = "*",
  })
end
