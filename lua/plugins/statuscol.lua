MiniDeps.now(function()
  MiniDeps.add({
    source = "luukvbaal/statuscol.nvim",
  })
  local builtin = require("statuscol.builtin")
  require("statuscol").setup({
    relculright = true,
    segments = {
      {
        sign = { name = { ".*" }, namespace = { ".*" }, maxwidth = 1, colwidth = 1, auto = false, fillchar = "~" },
        click = "v:lua.ScSa"
      },
      { text = { " " } },
      { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
      { text = { " " } },
      { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      { text = { " " }, condition = { vim.bo.filetype ~= "oil" } },
    }
  })
end)
