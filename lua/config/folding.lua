vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars:append({
  foldopen = "-",
  foldclose = "+",
})

vim.pack.add({ "https://github.com/kevinhwang91/nvim-ufo" })

-- Fold provider [ lsp, treesitter, indent ] per filetype
local ftprovider = {
  html = "indent",
  lua = "indent",
}

require("ufo").setup({
  ---@diagnostic disable-next-line: unused-local
  provider_selector = function(bufnr, filetype, buftype)
    return ftprovider[filetype]
  end,
  fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
  end,
  preview = {
    win_config = {
      border = vim.g.border,
      winblend = 0,
      winhighlight = "Normal:Normal",
      maxheight = 20,
    },
  },
})

vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Hover or Peek" })

vim.keymap.set("n", "<leader>tF", function()
  vim.opt.foldenable = not vim.opt.foldenable:get()
  local status = vim.opt.foldenable:get() and "enabled" or "disabled"
  print("Folding " .. status)
end, { desc = "Folding" })
