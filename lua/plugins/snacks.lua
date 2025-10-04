vim.cmd.packadd("snacks.nvim")
local layout = require("config.picker-layout")
require("snacks").setup({
  indent = {
    enabled = true,
    indent = {
      only_scope = true,
    },
    scope = {
      underline = true,
    },
  },
  scope = { enabled = true },
  words = { enabled = true },
  input = {
    enabled = true,
    icon = "",
    icon_hl = "SnacksInputIcon",
    icon_pos = "left",
    prompt_pos = "title",
    win = { style = "input" },
    expand = true,
  },
  image = { enabled = true },
  explorer = { enabled = true },
  dashboard = {
    preset = {
      header = [[
                    ██  ██  ██  ██            
                    ██  ██  ██  ██            
                    ██  ██  ██  ██            
                    ██  ██  ██  ██            
                    ██  ██  ██  ██            
██████████  ██████  ██  ██  ██  ██  ██  ██  ██
██      ██  ██  ██  ██  ██  ██  ██  ██  ██  ██
██████████  ██████████████  ██  ██  ██  ██  ██
██      ██                      ██  ██  ██  ██
██████  ██████████████████████████████████████
                                              
██████████████████████  ██████████████  ██  ██
██                  ██  ██              ██    
██  ██████████████  ██  ██  ██████████  ██  ██
██  ██          ██  ██  ██          ██  ██  ██
██  ██████████████  ██  ██  ██████████  ██  ██
    ██              ██  ██  ██          ██  ██
██████████  ██████████  ██  ██  ██████  ██  ██
██  ██  ██  ██              ██  ██  ██  ██  ██
██████████  ██  ██  ██  ██  ██  ██████  ██  ██
            ██  ██      ██  ██      ██████  ██
██  ██  ██████  ██████████████████████████  ██
      ]],
    },
    sections = {
      { section = "header" },
    },
  },
  picker = {
    layout = layout.vertical_main,
    win = {
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
        auto_close = true,
        supports_live = true,
        tree = true,
        watch = true,
        diagnostics = true,
        diagnostics_open = true,
        git_status = true,
        git_status_open = true,
        git_untracked = true,
        layout = layout.vertical_main,
        confirm = "cmd",
      },
      autocmds = { layout = layout.horizontal },
      command_history = { layout = layout.horizontal },
      commands = { layout = layout.horizontal },
      diagnostics = { layout = layout.horizontal_main },
      diagnostics_buffer = { layout = layout.horizontal_main },
      git_branches = { layout = layout.horizontal_main },
      git_grep = { layout = layout.horizontal_main },
      git_log = { layout = layout.horizontal_main },
      git_log_line = { layout = layout.horizontal_main },
      git_stash = { layout = layout.horizontal_main },
      grep = { layout = layout.horizontal_main },
      grep_buffers = { layout = layout.horizontal_main },
      grep_word = { layout = layout.horizontal_main },
      icons = { layout = layout.horizontal },
      jumps = { layout = layout.horizontal_main },
      keymaps = { layout = layout.horizontal_main },
      lines = { layout = layout.horizontal_main },
      lsp_config = { layout = layout.full },
      man = { layout = layout.horizontal_main },
      notifications = { layout = layout.horizontal },
      pickers = { layout = layout.vertical },
      registers = { layout = layout.horizontal_main },
      search_history = { layout = layout.horizontal },
      spelling = { layout = layout.horizontal },
    },
  },
})

vim.keymap.set("n", "<leader><leader>", function()
  Snacks.picker.pickers()
end, { desc = "Pickers" })

vim.keymap.set("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>d", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics (buffer)" })

vim.keymap.set("n", "<leader>D", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics (workspace)" })

vim.keymap.set("n", "<leader>e", function()
  Snacks.picker.explorer()
end, { desc = "Explorer" })

vim.keymap.set("n", "<leader>.", function()
  Snacks.picker.files()
end, { desc = "Files" })

vim.keymap.set("n", "<leader>bb", function()
  Snacks.picker.buffers()
end, { desc = "Switch Buffer" })

vim.keymap.set("n", "<leader>//", function()
  Snacks.picker.lines()
end, { desc = "Lines / Grep (buffer)" })

vim.keymap.set("n", "<leader>/,", function()
  Snacks.picker.grep_buffers()
end, { desc = "Grep (buffers)" })

vim.keymap.set("n", "<leader>/.", function()
  Snacks.picker.grep()
end, { desc = "Grep (work)space)" })

vim.keymap.set("n", "<leader>/w", function()
  Snacks.picker.grep_word()
end, { desc = "Grep (workspace)" })

vim.keymap.set("n", "<leader>o", function()
  Snacks.picker.jumps()
end, { desc = "Jumps" })

vim.keymap.set("n", "<leader>k", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>'", function()
  Snacks.picker.marks()
end, { desc = "Marks" })

vim.keymap.set("n", "<leader>p", function()
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
