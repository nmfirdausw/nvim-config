vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("blink_pairs_config", { clear = true }),
  callback = function()
    vim.schedule(function()
      require("blink.pairs").setup({
        mappings = {
          enabled = true,
          cmdline = true,
          disabled_filetypes = {},
          pairs = {},
        },
        highlights = {
          enabled = true,
          cmdline = true,
          groups = {
            "BlinkPairsOrange",
            "BlinkPairsPurple",
            "BlinkPairsBlue",
          },
          unmatched_group = "BlinkPairsUnmatched",
          matchparen = {
            enabled = true,
            cmdline = false,
            group = "BlinkPairsMatchParen",
          },
        },
        debug = false,
      })
    end)
  end,
  once = true,
})
