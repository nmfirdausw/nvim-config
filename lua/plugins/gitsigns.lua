MiniDeps.later(function()
  if Utils.gitdir() then
    MiniDeps.add({
      source = "lewis6991/gitsigns.nvim",
    })
  end

  local icons = {
    signs = {
      git = {
        added    = Icons.signs.git.added,
        changed  = Icons.signs.git.changed,
        deleted  = Icons.signs.git.deleted,
      }
    }
  }

  if not vim.g.icons then
    icons = {
      signs = {
        git = {
          added    = '+',
          changed  = '~',
          deleted  = '-',
        }
      }
    }
  end

  if Utils.gitdir() then
    require('gitsigns').setup({
      signs = {
        add          = { text = icons.signs.git.added },
        change       = { text = icons.signs.git.changed },
        delete       = { text = icons.signs.git.deleted },
        topdelete    = { text = icons.signs.git.deleted },
        changedelete = { text = icons.signs.git.changed },
        untracked    = { text = ' ' },
      },
      signs_staged = {
        add          = { text = icons.signs.git.added },
        change       = { text = icons.signs.git.changed },
        delete       = { text = icons.signs.git.deleted },
        topdelete    = { text = icons.signs.git.deleted },
        changedelete = { text = icons.signs.git.changed },
      },
      preview_config = {
        border = "rounded",
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.keymap.set(
          "n", "<leader>]h",
          function()
            if vim.wo.diff then
              vim.cmd.normal({']h', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end,
          { desc = "Hunk", buffer = bufnr}
        )

        vim.keymap.set(
          "n", "<leader>[h",
          function()
            if vim.wo.diff then
              vim.cmd.normal({'[h', bang = true})
            else
              gitsigns.nav_hunk('prev')
            end
          end,
          { desc = "Hunk", buffer = bufnr}
        )

        vim.keymap.set(
          "n", "<leader>[h",
          function()
            if vim.wo.diff then
              vim.cmd.normal({'[H', bang = true})
            else
              gitsigns.nav_hunk('first')
            end
          end,
          { desc = "First Hunk", buffer = bufnr}
        )

        vim.keymap.set(
          "n", "<leader>[h",
          function()
            if vim.wo.diff then
              vim.cmd.normal({']H', bang = true})
            else
              gitsigns.nav_hunk('last')
            end
          end,
          { desc = "Last Hunk", buffer = bufnr}
        )

        vim.keymap.set('n', '<leader>ghs', gitsigns.stage_hunk, { desc = "Stage", buffer = bufnr })
        vim.keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, { desc = "Reset", buffer = bufnr })

        vim.keymap.set(
          'v', '<leader>ghs',
          function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end,
          { desc = "Stage", buffer = bufnr }
        )

        vim.keymap.set(
          'v', '<leader>ghr',
          function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end,
          { desc = "Reset", buffer = bufnr }
        )

        vim.keymap.set('n', '<leader>gs', gitsigns.stage_buffer, { desc = "Stage buffer", buffer = bufnr })
        vim.keymap.set('n', '<leader>gs', gitsigns.reset_buffer, { desc = "Reset buffer", buffer = bufnr })
        vim.keymap.set('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = "Undo stage", buffer = bufnr })
        vim.keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, { desc = "Preview", buffer = bufnr })
        vim.keymap.set('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = "Inline preview", buffer = bufnr })
        vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line", buffer = bufnr })
        vim.keymap.set('n', '<leader>tgB', gitsigns.toggle_current_line_blame, { desc = "Blame buffer", buffer = bufnr })
        vim.keymap.set('n', '<leader>tgd', gitsigns.toggle_deleted, { desc = "Deleted", buffer = bufnr })
        vim.keymap.set('n', '<leader>tgw', gitsigns.toggle_word_diff, { desc = "Word diff", buffer = bufnr })
        vim.keymap.set('n', '<leader>tgl', gitsigns.toggle_linehl, { desc = "Line highlight", buffer = bufnr })
        vim.keymap.set('n', '<leader>tgn', gitsigns.toggle_numhl, { desc = "Number highlight", buffer = bufnr })
        vim.keymap.set('n', '<leader>tgs', gitsigns.toggle_signs, { desc = "Signs", buffer = bufnr })
        vim.keymap.set({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = "Select hunk", buffer = bufnr })
        vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = "Diff buffer", buffer = bufnr })
      end,
    })
  end
end)

