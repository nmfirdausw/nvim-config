vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  -- { src = "https://github.com/copilotlsp-nvim/copilot-lsp" },
  { src = "https://github.com/zbirenbaum/copilot.lua" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-mini/mini.ai" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/Saghen/blink.cmp", version = "main" },
  { src = "https://github.com/Saghen/blink.pairs", version = "main" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/kevinhwang91/promise-async" },
  { src = "https://github.com/kevinhwang91/nvim-ufo" },
})

if Utils.is_git_dir() then
  vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
end
