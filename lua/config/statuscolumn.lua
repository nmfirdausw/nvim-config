local statuscolumn = function()
  local lnum = vim.v.lnum
  local bufnr = vim.api.nvim_get_current_buf()
  local signs = vim.fn.sign_getplaced(bufnr, { lnum = lnum, group = "*" })[1].signs
  local fillchars = vim.opt.fillchars:get()
  local statuscolumn = "%=%4r%4l"

  if vim.opt.number:get() or vim.opt.relativenumber:get() then
    statuscolumn = statuscolumn .. "  "
  end

  if vim.opt.signcolumn:get() == "no" then
    if vim.opt.number:get() or vim.opt.relativenumber:get() then
      return statuscolumn .. " "
    else
      return statuscolumn .. ""
    end
  end

  if vim.opt.foldenable:get() then
    if vim.fn.foldlevel(lnum) > 0 then
      if vim.fn.foldclosed(lnum) ~= -1 then
        return statuscolumn .. fillchars.foldclose .. "  "
      end

      if vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
        if #signs > 0 and not signs[1].group:match("gitsigns_signs_") then
          return statuscolumn .. "%s "
        end

        return statuscolumn .. fillchars.foldopen .. "  "
      end
    end
  end

  if #signs > 0 then
    return statuscolumn .. "%s "
  end

  return statuscolumn .. "│  "
end

_G.StatusColumn = statuscolumn
vim.o.statuscolumn = "%{%v:lua._G.StatusColumn()%}"

-- Keymaps for toggling statuscolumn elements
vim.keymap.set("n", "<leader>tn", function()
  vim.opt.number = not vim.opt.number:get()
  local status = vim.opt.number:get() and "enabled" or "disabled"
  vim.notify("Line numbers " .. status)
end, { desc = "Toggle line numbers" })

vim.keymap.set("n", "<leader>tr", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  local status = vim.opt.relativenumber:get() and "enabled" or "disabled"
  vim.notify("Relative line numbers " .. status)
end, { desc = "Toggle relative numbers" })

vim.keymap.set("n", "<leader>ts", function()
  local current = vim.opt.signcolumn:get()
  if current == "yes" then
    vim.opt.signcolumn = "no"
    vim.notify("Sign column disabled")
  else
    vim.opt.signcolumn = "yes"
    vim.notify("Sign column enabled")
  end
end, { desc = "Toggle sign column" })

-- Disable statuscolumn for help file
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.opt_local.statuscolumn = ""
      vim.opt_local.number = false
      vim.opt_local.signcolumn = "no"
    end
  end,
})
