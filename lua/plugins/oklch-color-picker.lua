return {
  "eero-lehtinen/oklch-color-picker.nvim",
  event = "VeryLazy",
  version = "*",
  keys = {
    {
      "<leader>c",
      function() require("oklch-color-picker").pick_under_cursor() end,
      desc = "Color pick under cursor",
    },
  },
  opts = {
    highlight = {
      enabled = true,
      edit_delay = 60,
      scroll_delay = 0,
      style = "virtual_left",
      virtual_text = " ",
      priority = 500,
    },
  },
}
