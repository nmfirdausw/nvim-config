local picker = require("config.picker")

require("snacks").setup({
  notifier = {
    enabled = false,
  },
  explorer = {
    enabled = true,
    replace_netrw = true,
  },
  input = {
    enabled = true,
    icon = " ",
    icon_hl = "SnacksInputIcon",
    icon_pos = "left",
    prompt_pos = "title",
    win = { style = "input" },
    expand = true,
  },
  indent = {
    enabled = true,
    indent = {
      only_scope = true,
    },
    scope = {
      underline = true,
    },
  },
  picker = {
    layout = picker.layout.vertical_main,
    win = {
      list = {
        wo = {
          foldcolumn = "0",
        },
      },
      preview = {
        wo = {
          statuscolumn = "%{%v:lua._G.StatusColumn()%}",
          signcolumn = "yes",
          foldcolumn = "0",
          foldenable = false,
        },
      },
      scope = { enabled = true },
      words = { enabled = true },
    },
    sources = {
      explorer = {
        supports_live = true,
        tree = true,
        watch = true,
        diagnostics = true,
        diagnostics_open = true,
        git_status = true,
        git_status_open = true,
        git_untracked = true,
        auto_close = true,
        layout = picker.layout.vertical_main,
      },
      autocmds = { layout = picker.layout.horizontal },
      command_history = { layout = picker.layout.horizontal },
      commands = { layout = picker.layout.horizontal },
      diagnostics = { layout = picker.layout.horizontal_main },
      diagnostics_buffer = { layout = picker.layout.horizontal_main },
      git_branches = { layout = picker.layout.horizontal_main },
      git_grep = { layout = picker.layout.horizontal_main },
      git_log = { layout = picker.layout.horizontal_main },
      git_log_line = { layout = picker.layout.horizontal_main },
      git_stash = { layout = picker.layout.horizontal_main },
      grep = { layout = picker.layout.horizontal_main },
      grep_buffers = { layout = picker.layout.horizontal_main },
      grep_word = { layout = picker.layout.horizontal_main },
      icons = { layout = picker.layout.horizontal },
      jumps = { layout = picker.layout.horizontal_main },
      keymaps = { layout = picker.layout.horizontal_main },
      lines = { layout = picker.layout.horizontal_main },
      lsp_config = { layout = picker.layout.full },
      man = { layout = picker.layout.horizontal_main },
      notifications = { layout = picker.layout.horizontal },
      pickers = { layout = picker.layout.vertical },
      registers = { layout = picker.layout.horizontal_main },
      search_history = { layout = picker.layout.horizontal },
      spelling = { layout = picker.layout.horizontal },
    },
  },
})

vim.keymap.set("n", "<leader><leader>", function()
  Utils.close_all_floating_win()
  Snacks.picker.pickers()
end, { desc = "Pickers" })

vim.keymap.set("n", "<leader>,", function()
  Utils.close_all_floating_win()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>:", function()
  Utils.close_all_floating_win()
  Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>d", function()
  Utils.close_all_floating_win()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics (buffer)" })

vim.keymap.set("n", "<leader>D", function()
  Utils.close_all_floating_win()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics (workspace)" })

vim.keymap.set("n", "<leader>e", function()
  Utils.close_all_floating_win()
  Snacks.picker.explorer()
end, { desc = "Explorer" })

vim.keymap.set("n", "<leader>.", function()
  Utils.close_all_floating_win()
  Snacks.picker.files()
end, { desc = "Files" })

vim.keymap.set("n", "<leader>bb", function()
  Utils.close_all_floating_win()
  Snacks.picker.buffers()
end, { desc = "Switch Buffer" })

vim.keymap.set("n", "<leader>//", function()
  Utils.close_all_floating_win()
  Snacks.picker.lines()
end, { desc = "Lines / Grep (buffer)" })

vim.keymap.set("n", "<leader>/,", function()
  Utils.close_all_floating_win()
  Snacks.picker.grep_buffers()
end, { desc = "Grep (buffers)" })

vim.keymap.set("n", "<leader>/.", function()
  Utils.close_all_floating_win()
  Snacks.picker.grep()
end, { desc = "Grep (work)space)" })

vim.keymap.set("n", "<leader>/w", function()
  Utils.close_all_floating_win()
  Snacks.picker.grep_word()
end, { desc = "Grep (workspace)" })

vim.keymap.set("n", "<leader>o", function()
  Utils.close_all_floating_win()
  Snacks.picker.jumps()
end, { desc = "Jumps" })

vim.keymap.set("n", "<leader>k", function()
  Utils.close_all_floating_win()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>'", function()
  Utils.close_all_floating_win()
  Snacks.picker.marks()
end, { desc = "Marks" })

vim.keymap.set("n", "<leader>p", function()
  Utils.close_all_floating_win()
  Snacks.picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>r", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

vim.keymap.set("n", "<leader>f", function()
  Snacks.picker.smart()
end, { desc = "Files (smart)" })

vim.keymap.set("n", "<leader>s", function()
  Snacks.picker.spelling()
end, { desc = "Spelling" })

vim.keymap.set("n", "<leader>u", function()
  Snacks.picker.undo()
end, { desc = "Undo" })
