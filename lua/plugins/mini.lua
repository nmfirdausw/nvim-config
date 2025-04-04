return {
  { "echasnovski/mini.ai", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.align", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.bracketed", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.comment", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.cursorword", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.splitjoin", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
  {
    "echasnovski/mini.trailspace",
    event = "VeryLazy",
    keys = {
      { "gs", function() MiniTrailspace.trim() end, desc = "Trim trailing whitespace" },
    },
    opts = {},
  },
  {
    "nmfirdausw/mini.pick",
    event = "VeryLazy",
    keys = {
      { "<leader>.", function() MiniPick.builtin.files() end, desc = "Search file" },
      { "<leader>/", function() MiniPick.builtin.grep_live() end, desc = "Live grep" },
      { "<leader>b", function() MiniPick.builtin.buffers() end, desc = "Search buffer" },
    },
    opts = function()
      local pick = require("mini.pick")
      local icons = {
        directory = vim.g.icons and " " .. Icons.folder or " ◯ ",
        file = vim.g.icons and " " .. Icons.file or " 󰑊 ",
        none = " ",
      }
      local win_config = function()
        local height = vim.o.lines
        local width = vim.o.columns
        return {
          border = "rounded",
          height = vim.o.lines,
          width = vim.o.columns,
          row = math.floor(1 * (vim.o.lines - height)),
          col = math.floor(1 * (vim.o.columns - width)),
        }
      end
      return {
        window = {
          config = win_config,
          prompt_prefix = vim.g.icons and "  " or " / ",
        },
        source = {
          show = function(buf_id, items, query)
            return pick.default_show(
              buf_id,
              items,
              query,
              { show_icons = true, icons = { directory = icons.directory, file = icons.file, none = " " } }
            )
          end,
        },
      }
    end
  },
  {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.extra",
    event = "VeryLazy",
    keys = function()
      local keys = {
        { "<leader>e", function() MiniExtra.pickers.explorer() end, desc = "File explorer" },
        { "<leader>sd", function() MiniExtra.pickers.diagnostic() end, desc = "Diagnostics" },
        { "<leader>sh", function() MiniExtra.pickers.hl_groups() end, desc = "Highlights" },
        { "<leader>sb", function() MiniExtra.pickers.buf_lines() end, desc = "Buffer lines" },
        { "<leader>sC", function() MiniExtra.pickers.commands() end, desc = "Commands" },
        { "<leader>sc", function() MiniExtra.pickers.history() end, desc = "Command history" },
        { "<leader>sk", function() MiniExtra.pickers.keymaps() end, desc = "Keymaps" },
        { "<leader>sq", function() MiniExtra.pickers.list({ scope = "quickfix" }) end, desc = "Quickfix list" },
        { "<leader>sl", function() MiniExtra.pickers.list({ scope = "location" }) end, desc = "Location list" },
        { "<leader>sj", function() MiniExtra.pickers.list({ scope = "jump" }) end, desc = "Jump list" },
        { "<leader>sm", function() MiniExtra.pickers.marks() end, desc = "Marks" },
        { "<leader>so", function() MiniExtra.pickers.oldfiles() end, desc = "Old files" },
        { "<leader>sO", function() MiniExtra.pickers.options() end, desc = "Old files" },
        { "<leader>sr", function() MiniExtra.pickers.registers() end, desc = "Registers" },
        { "<leader>sn", function() MiniExtra.pickers.treesitter() end, desc = "Nodes" },
        { "<leader>sv", function() MiniExtra.pickers.visit_paths() end, desc = "Visit paths" },
        { "<leader>sV", function() MiniExtra.pickers.visit_labels() end, desc = "Visit labels" },
      }
      if Utils.gitdir() then
        table.insert(keys, { "<leader>sgb", function() MiniExtra.pickers.git_branches() end, desc = "Branches" })
        table.insert(keys, { "<leader>sgc", function() MiniExtra.pickers.git_commits() end, desc = "Commits" })
        table.insert(keys, { "<leader>sgf", function() MiniExtra.pickers.git_files() end, desc = "Files" })
        table.insert(keys, { "<leader>sgh", function() MiniExtra.pickers.git_hunks() end, desc = "Hunks" })
      end
      return keys
    end,
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = false, terminal = false },
      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
        [" "] = { action = "open", pair = "  ", neigh_pattern = "[^\\]." },
        ["!"] = { action = "open", pair = "!!", neigh_pattern = "[^\\]." },
        ["-"] = { action = "open", pair = "--", neigh_pattern = "[^\\]." },

        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      },
      skip_next = [=[[%w%%%"%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function(_, opts)
      local pairs = require("mini.pairs")
      pairs.setup(opts)
      local open = pairs.open
      pairs.open = function(pair, neigh_pattern)
        if vim.fn.getcmdline() ~= "" then
          return open(pair, neigh_pattern)
        end
        local o, c = pair:sub(1, 1), pair:sub(2, 2)
        local line = vim.api.nvim_get_current_line()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local next = line:sub(cursor[2] + 1, cursor[2] + 1)
        local before = line:sub(1, cursor[2])
        local before_before = line:sub(cursor[2] - 1, cursor[2] - 1)
        local next_next = line:sub(cursor[2] + 2, cursor[2] + 2)
        local skip_next = opts.skip_next

        if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
          return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
        end

        if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
          return o
        end

        if opts.skip_ts and #opts.skip_ts > 0 then
          local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
          for _, capture in ipairs(ok and captures or {}) do
            if vim.tbl_contains(opts.skip_ts, capture.capture) then
              return o
            end
          end
        end
        if opts.skip_unbalanced and next == c and c ~= o then
          local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
          local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
          if count_close > count_open then
            return o
          end
        end

        if o == " " then
          if before:match("[{!-]") and next:match("[-!}]") then
            return open(pair, neigh_pattern)
          end
          return o
        end

        if o == "-" then
          if before:match("[{]") and next:match("[}]") then
            return open(pair, neigh_pattern)
          elseif before:match("[-]") and next:match("[-]") then
            if before_before:match("[{]") and next_next:match("[}]") then
              return open(pair, neigh_pattern)
            end
          end
          return o
        end

        if o == "!" then
          if before:match("[{]") and next:match("[}]") then
            return open(pair, neigh_pattern)
          elseif before:match("[!]") and next:match("[!]") then
            if before_before:match("[{]") and next_next:match("[}]") then
              return open(pair, neigh_pattern)
            end
          end
          return o
        end

        return open(pair, neigh_pattern)
      end
    end
  },
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {
      mappings = {
        left       = "<M-m>",
        right      = "<M-i>",
        down       = "<M-n>",
        up         = "<M-e>",
        line_left  = "<M-m>",
        line_right = "<M-i>",
        line_down  = "<M-n>",
        line_up    = "<M-e>",
      },
    },
  }
}
