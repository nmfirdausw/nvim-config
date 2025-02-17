MiniDeps.now(function()
  local my_prefix = function(fs_entry)
    if fs_entry.fs_type == 'directory' then
      if vim.g.icons then return Icons.folder, 'MiniFilesDirectory' end
      return ' ◯ ', 'MiniFilesDirectory'
    end
    local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
    if not has_devicons then return ' 󰑊 ', 'MiniFilesFile' end

    local icon, hl = devicons.get_icon(fs_entry.name, nil, { default = false })
    if vim.g.icons then
      if icon == nil then return Icons.file, 'MiniFilesFile' end
      return icon .. ' ', hl or 'MiniFilesFile'
    end
      return ' 󰑊 ', hl or 'MiniFilesFile'
  end

  require('mini.files').setup({
    content = { prefix = my_prefix },
    mappings = {
      close       = '<esc>',
      go_in       = '',
      go_in_plus  = '<cr>',
      go_out      = '<bs>',
      go_out_plus = '',
      mark_goto   = "'",
      mark_set    = 'm',
      reset       = '<tab>',
      reveal_cwd  = '@',
      show_help   = 'g?',
      synchronize = '=',
      trim_left   = '<',
      trim_right  = '>',
    },
    windows = {
      preview = true,
      width_focus = 37,
      width_preview = vim.o.columns - 41,
    },
  })

  vim.keymap.set('n', '<bs>', function() MiniFiles.open() end, { desc = 'File explorer' })

  vim.api.nvim_create_autocmd('VimResized', {
    callback = function()
      local new_width_preview = vim.o.columns - 41
      MiniFiles.refresh({ windows = { width_preview = new_width_preview } })
      MiniFiles.config.windows.width_preview = new_width_preview
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id

      local config = vim.api.nvim_win_get_config(win_id)
      config.border, config.title_pos = 'rounded', 'left'
      vim.api.nvim_win_set_config(win_id, config)
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id

      local config = vim.api.nvim_win_get_config(win_id)
      config.border, config.title_pos = 'rounded', 'left'
      vim.api.nvim_win_set_config(win_id, config)
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowUpdate',
    callback = function(args)
      local config = vim.api.nvim_win_get_config(args.data.win_id)

      if config.title[#config.title][1] ~= ' ' then
        table.insert(config.title, { ' ', 'NormalFloat' })
      end
      if config.title[1][1] ~= ' ' then
        table.insert(config.title, 1, { ' ', 'NormalFloat' })
      end

      vim.api.nvim_win_set_config(args.data.win_id, config)
    end,
  })
end)
