return { "kevinhwang91/nvim-ufo",
  lazy = false,
  dependencies = {
    "kevinhwang91/promise-async",
  },
  opts = {
    provider_selector = function()
      return {"treesitter", "indent"}
    end
  }
}
