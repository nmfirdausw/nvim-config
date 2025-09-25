local commands = {
  "Mason",
  "MasonInstall",
  "MasonLog",
  "MasonUninstall",
  "MasonUninstallAll",
  "MasonUpdate",
}

local setup = function()
  for _, command in ipairs(commands) do
    vim.api.nvim_del_user_command(command)
  end
  vim.cmd.packadd("mason.nvim")
  require("mason").setup({
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
    ui = {
      border = vim.g.border,
      icons = {
        package_installed = "+",
        package_pending = "!",
        package_uninstalled = "x",
      },
    },
  })
end

vim.api.nvim_create_user_command("LoadMason", setup, {})

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
