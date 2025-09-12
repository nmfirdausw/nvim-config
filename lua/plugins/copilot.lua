return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-a>",
        next = "<C-n>",
        prev = "<C-e>",
      },
    },
  }
}
