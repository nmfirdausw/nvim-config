return {
  "eero-lehtinen/oklch-color-picker.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    local picker = require("oklch-color-picker")

    picker.setup(opts)

    vim.keymap.set("n", "<leader>cp", function()
      picker.pick_under_cursor()
    end, { desc = "Pick color under cursor" })
    vim.keymap.set("n", "<leader>cc", function()
      picker.open_picker()
    end, { desc = "Open color picker" })
    vim.keymap.set("n", "<leader>ct", function()
      picker.highlight.toggle()
    end, { desc = "Toggle color highlight" })
    vim.keymap.set("n", "<leader>tc", function()
      picker.highlight.toggle()
    end, { desc = "Color highlight" })
  end,
}
