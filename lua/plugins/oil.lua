return {
  "stevearc/oil.nvim",
  lazy = false,
  priority = 500,
  keys = {
    { "<bs>", "<cmd>Oil<cr>", desc = "File Explorer [Oil]", silent = true },
  },
  opts = {
    default_file_explorer = true,
    win_options = {
      wrap = false,
      signcolumn = "yes",
    },
    delete_to_trash = true,
    confirmation = {
      border = "rounded",
    },
    columns = {
      {
        "icon",
        add_padding = false,
        directory = vim.g.icons and Icons.folder:gsub("%s+$", "") or "○",
        default_file = vim.g.icons and Icons.file:gsub("%s+$", "") or "󰑊",
      },
    },
  }
}
