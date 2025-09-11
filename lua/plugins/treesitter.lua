return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  keys = {
    {
      "<leader>ts",
      function()
        local buf = vim.api.nvim_get_current_buf()
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not lang or not pcall(vim.treesitter.language.add, lang) then
          return
        end
        
        if vim.treesitter.highlighter.active[buf] then
          vim.treesitter.stop(buf)
        else
          vim.treesitter.start(buf)
        end
      end,
      desc = "Toggle syntax highlighting",
    },
  },
  config = function()
    require("config.treesitter")
  end
}
