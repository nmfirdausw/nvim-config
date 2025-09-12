return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        show_source = {
          enabled = true,
        },
        use_icons_from_diagnostic = true,
        throttle = 0,
        enable_on_insert = false,
      },
    })
    require("config.diagnostics")
  end,
}
