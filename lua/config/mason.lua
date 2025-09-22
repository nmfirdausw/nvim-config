local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin_path .. ":" .. vim.env.PATH

vim.api.nvim_create_user_command("Mason", function(opts)
  vim.api.nvim_del_user_command("Mason")

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

  vim.cmd("Mason")
end, {})

