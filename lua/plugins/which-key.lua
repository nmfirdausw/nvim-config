MiniDeps.later(function()
  MiniDeps.add({
    source = 'folke/which-key.nvim',
  })
  require('which-key').setup({
    preset = 'helix',
    win = {
      no_overlap = true,
      col = 0,
    },
    icons = {
      mappings = false,
    },
    spec = {
    },
  })
end)
