MiniDeps.now(function()
  MiniDeps.add({
    source = 'folke/snacks.nvim',
  })
  require('snacks').setup({
    styles = {
      blame_line = {
        width = 0.6,
        height = 0.6,
        border = 'rounded',
        title = ' Git Blame ',
        title_pos = 'left',
        ft = 'git',
      },
      float = {
        position = 'float',
        backdrop = 100,
        height = 0.9,
        width = 0.9,
        zindex = 50,
      }
    },
    bigfile = { enable = true },
    bufdelete = { enable = true },
    dim = {
      enable = true,
      scope = {
        min_size = 1,
        max_size = 15,
        sibling = false,
      }
    },
    image = { enable = true },
    input = { enable = true },
    lazygit = { enable = true },
    rename = { enable = true },
    words = { enable = true },
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesActionRename',
    callback = function(event)
      Snacks.rename.on_rename_file(event.data.from, event.data.to)
    end,
  })

  if Utils.gitdir() then
    vim.keymap.set({ 'n', 'v' }, '<leader>gB', function() Snacks.gitbrowse() end, { desc = 'View Repository' })
    vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'Lazygit' })
  end

  vim.keymap.set('n', '<leader>n', function() Snacks.notifier.show_history() end, { desc = 'Notification History' })
  vim.keymap.set('n', '<leader>q', function() Snacks.bufdelete() end, { desc = 'Delete Buffer' })
  vim.keymap.set('n', 'gR', function() Snacks.rename.rename_file() end, { desc = 'Rename File' })
  vim.keymap.set('n', '<leader>un', function() Snacks.notifier.hide() end, { desc = 'Dismiss All Notifications' })
  vim.keymap.set('n', '<c-/>', function() Snacks.terminal() end, { desc = 'Toggle Terminal' })
  vim.keymap.set({ 'n', 't' }, ']]', function() Snacks.words.jump(vim.v.count1) end, { desc = 'Next Reference' })
  vim.keymap.set({ 'n', 't' }, '[[', function() Snacks.words.jump(-vim.v.count1) end, { desc = 'Prev Reference' })
  vim.keymap.set('n', '<leader>N',
  function()
    Snacks.win({
      file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
      width = 0.6,
      height = 0.6,
      border = 'rounded',
      wo = {
        spell = false,
        wrap = false,
        signcolumn = 'yes',
        statuscolumn = ' ',
        conceallevel = 3,
      },
    })
  end, { desc = 'Neovim News' })
end)
