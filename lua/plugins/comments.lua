return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufWritePre", "InsertEnter" },
    opts = function()
      return {
        keywords = {
          -- FIX:
          FIX = {
            icon = vim.g.icons and Icons.signs.comments.fix or "○",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          -- TODO:
          TODO = {
            icon = vim.g.icons and Icons.signs.comments.todo or "○",
            color = "hint",
          },
          -- HACK:
          HACK = {
            icon = vim.g.icons and Icons.signs.comments.hack or "○",
            color = "warning",
          },
          -- WARN:
          WARN = {
            icon = vim.g.icons and Icons.signs.comments.warn or "○",
            color = "warning",
            alt = { "WARNING", "XXX" },
          },
          -- PERF:
          PERF = {
            icon = vim.g.icons and Icons.signs.comments.perf or "○",
            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
          },
          -- NOTE:
          NOTE = {
            icon = vim.g.icons and Icons.signs.comments.note or "○",
            color = "info",
            alt = { "INFO" },
          },
          -- TEST:
          TEST = {
            icon = vim.g.icons and Icons.signs.comments.test or "○",
            color = "test",
            alt = { "TESTING", "PASSED", "FAILED" },
          },
        },
      }
    end,
  },
}
