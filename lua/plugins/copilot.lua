MiniDeps.later(function()
  MiniDeps.add({
    source = 'zbirenbaum/copilot.lua',
  })

  require('copilot').setup({
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      keymap = {
        accept = '<C-a>',
        next = '<C-e>',
        prev = '<C-n>',
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  })
end)
