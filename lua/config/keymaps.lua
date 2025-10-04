-- ============================================================================
-- Keymaps: Custom key mappings for enhanced Neovim experience
-- ============================================================================
-- Custom keymaps that override or extend default Vim key bindings
-- to improve the overall editing experience.

-- Copy to system clipboard with Cmd+C (Mac)
vim.keymap.set({ "n", "v" }, "<D-c>", "\"+y")

-- Enhanced navigation: Shift + arrows for faster movement
vim.keymap.set("n", "<S-down>", "}")
vim.keymap.set("n", "<S-up>", "{")
vim.keymap.set("n", "<S-left>", "b")
vim.keymap.set("n", "<S-right>", "w")

-- Keep cursor centered when scrolling half-page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep visual selection active after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Clear search highlighting with Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Toggle line numbers on/off
vim.keymap.set("n", "<leader>tn", function()
  vim.opt.number = not vim.opt.number:get()
  local status = vim.opt.number:get() and "enabled" or "disabled"
  vim.notify("Line numbers " .. status)
end, { desc = "Toggle line numbers" })

-- Toggle relative line numbers on/off
vim.keymap.set("n", "<leader>tr", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  local status = vim.opt.relativenumber:get() and "enabled" or "disabled"
  vim.notify("Relative line numbers " .. status)
end, { desc = "Toggle relative numbers" })

-- Toggle sign column visibility
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
