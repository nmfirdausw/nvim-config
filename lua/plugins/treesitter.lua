MiniDeps.later(function()
  MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
		hooks = {
			post_checkout = function()
				vim.cmd('TSUpdate')
			end
		},
  })

  require('nvim-treesitter.configs').setup({
    sync_install = true,
    ensure_installed = {
      'lua',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    },
    highlight = {
      enable = true
    },
  })
end)

