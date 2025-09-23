vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("copilot_config", { clear = true }),
  callback = function()
  --   require("copilot-lsp").setup({
  --     nes = {
  --       move_count_threshold = 3,
  --     }
  --   })
  --
  --   vim.g.copilot_nes_debounce = 500
  --   vim.lsp.enable("copilot_ls")
  --   vim.keymap.set("n", "<tab>", function()
  --     local bufnr = vim.api.nvim_get_current_buf()
  --     local state = vim.b[bufnr].nes_state
  --     if state then
  --       local result = require("copilot-lsp.nes").walk_cursor_start_edit()
  --         or (
  --           require("copilot-lsp.nes").apply_pending_nes()
  --           and require("copilot-lsp.nes").walk_cursor_end_edit()
  --         )
  --       return nil
  --     else
  --       return "<C-i>"
  --     end
  --   end, { desc = "Accept Copilot NES suggestion", expr = true })
  --
  --   vim.keymap.set("n", "<esc>", function()
  --       require("copilot-lsp.nes").clear()
  --   end, { desc = "Clear Copilot suggestion or fallback" })

    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-a>",
          next = "<C-n>",
          prev = "<C-e>",
        },
      },
    })
  end,
  once = true,
})
