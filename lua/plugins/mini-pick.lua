MiniDeps.later(function()
  require("mini.visits").setup()

  local pick = require("mini.pick")
  pick.setup({
    window = {
      config = {
        border = "rounded",
      },
      prompt_prefix = "  ",
    },
    source = {
      show = function(buf_id, items, query)
        return pick.default_show(
          buf_id,
          items,
          query,
          { show_icons = true, icons = { directory = "  ", file = " ◯ ", none = "◯" } }
        )
      end,
    },
  })
  vim.keymap.set("n", "<leader>.", function() MiniPick.builtin.files() end,     { desc = "Search file" })
  vim.keymap.set("n", "<leader>/", function() MiniPick.builtin.grep_live() end, { desc = "Live grep" })
  vim.keymap.set("n", "<leader>b", function() MiniPick.builtin.buffers() end,   { desc = "Search buffer" })

  require("mini.extra").setup()
  vim.keymap.set("n", "<leader>e",  function() MiniExtra.pickers.explorer() end,     { desc = "File explorer" })
  vim.keymap.set("n", "<leader>sd", function() MiniExtra.pickers.diagnostic() end,   { desc = "Diagnostics" })
  vim.keymap.set("n", "<leader>sh", function() MiniExtra.pickers.hl_groups() end,    { desc = "Highlights" })
  vim.keymap.set("n", "<leader>sb", function() MiniExtra.pickers.buf_lines() end,    { desc = "Buffer lines" })
  vim.keymap.set("n", "<leader>sC", function() MiniExtra.pickers.commands() end,     { desc = "Commands" })
  vim.keymap.set("n", "<leader>sc", function() MiniExtra.pickers.history() end,      { desc = "Command history" })
  vim.keymap.set("n", "<leader>sk", function() MiniExtra.pickers.keymaps() end,      { desc = "Keymaps" })
  vim.keymap.set("n", "<leader>sq", function() MiniExtra.pickers.list(               { scope = "quickfix" }) end, { desc = "Quickfix list" })
  vim.keymap.set("n", "<leader>sl", function() MiniExtra.pickers.list(               { scope = "location" }) end, { desc = "Location list" })
  vim.keymap.set("n", "<leader>sj", function() MiniExtra.pickers.list(               { scope = "jump" }) end,     { desc = "Jump list" })
  vim.keymap.set("n", "<leader>sm", function() MiniExtra.pickers.marks() end,        { desc = "Marks" })
  vim.keymap.set("n", "<leader>so", function() MiniExtra.pickers.oldfiles() end,     { desc = "Old files" })
  vim.keymap.set("n", "<leader>sO", function() MiniExtra.pickers.options() end,      { desc = "Old files" })
  vim.keymap.set("n", "<leader>sr", function() MiniExtra.pickers.registers() end,    { desc = "Registers" })
  vim.keymap.set("n", "<leader>sn", function() MiniExtra.pickers.treesitter() end,   { desc = "Nodes" })
  vim.keymap.set("n", "<leader>sv", function() MiniExtra.pickers.visit_paths() end,  { desc = "Visit paths" })
  vim.keymap.set("n", "<leader>sV", function() MiniExtra.pickers.visit_labels() end, { desc = "Visit labels" })

  if Utils.gitdir() then
    vim.keymap.set("n", "<leader>sgb", function() MiniExtra.pickers.git_branches() end, { desc = "Branches" })
    vim.keymap.set("n", "<leader>sgc", function() MiniExtra.pickers.git_commits() end, { desc = "Commits" })
    vim.keymap.set("n", "<leader>sgf", function() MiniExtra.pickers.git_files() end, { desc = "Files" })
    vim.keymap.set("n", "<leader>sgh", function() MiniExtra.pickers.git_hunks() end, { desc = "Hunks" })
  end

end)
