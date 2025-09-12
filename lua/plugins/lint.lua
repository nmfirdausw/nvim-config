return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = function()
    local lint = require("lint")
    local linters = require("config.linters").linters

    for _, linter in pairs(linters) do
      lint.linters[linter] = require("config.linters")[linter]
    end

    lint.linters_by_ft = require("config.linters").linters_by_ft

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
