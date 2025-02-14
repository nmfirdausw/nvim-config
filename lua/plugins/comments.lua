MiniDeps.later(function()
  MiniDeps.add({
    source = 'folke/todo-comments.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })

  require('todo-comments').setup({
    keywords = {
      FIX = {
        icon = Icons.signs.comments.fix,
        color = 'error',
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
      },
      TODO = {
        icon = Icons.signs.comments.todo,
        color = 'hint',
      },
      HACK = {
        icon = Icons.signs.comments.hack,
        color = 'warning',
      },
      WARN = {
        icon = Icons.signs.comments.warn,
        color = 'warning',
        alt = { 'WARNING', 'XXX' },
      },
      PERF = {
        icon = Icons.signs.comments.perf,
        alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
      },
      NOTE = {
        icon = Icons.signs.comments.note,
        color = 'info',
        alt = { 'INFO' },
      },
      TEST = {
        icon = Icons.signs.comments.test,
        color = 'test',
        alt = { 'TESTING', 'PASSED', 'FAILED' },
      },
    }
  })

  MiniDeps.add({
    source = 'folke/ts-comments.nvim',
  })

  require('ts-comments').setup()
end)
