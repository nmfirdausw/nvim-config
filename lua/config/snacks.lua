vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local closePicker = function()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) then
      local ft = vim.bo[buf].filetype
      if ft:match("^snacks_picker_") then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

local no_preview = function()
  local term_width = vim.o.columns
  local height = vim.o.lines - vim.opt.cmdheight:get() - 1
  return {
    preview = false,
    layout = {
      backdrop = false,
      box = "horizontal",
      row = 0,
      col = 0,
      width = term_width,
      height = height,
      {
        box = "vertical",
        border = "none",
        title = "{title} {live} {flags}",
        { win = "input", height = 1, border = { "", "", "", "", "", "", "", " " } },
        { win = "list", border = "none" },
      },
    },
  }
end

local with_preview = function()
  local win_id = vim.api.nvim_get_current_win()
  local win_width = vim.fn.winwidth(0)
  local win_pos = vim.api.nvim_win_get_position(win_id)
  local term_width = vim.o.columns
  local height = vim.o.lines - vim.opt.cmdheight:get() - 1

  if win_pos[2] == 0 then
    local width = term_width - win_width
    if win_width >= term_width then
      local golden_width = math.floor(win_width / 1.618)
      width = win_width - golden_width
    end
    return {
      preview = "main",
      layout = {
        backdrop = false,
        box = "horizontal",
        row = 0,
        col = term_width - width,
        width = width,
        height = height,
        {
          box = "vertical",
          border = "left",
          title = "{title} {live} {flags}",
          { win = "input", height = 1, border = { "", "", "", "", "", "", "", " " } },
          { win = "list", border = "none" },
        },
        { win = "preview", title = "{preview}", border = "none" },
      },
    }
  else
    local width = win_pos[2]
    print("width", width)
    return {
      preview = "main",
      layout = {
        box = "horizontal",
        row = 0,
        col = 0,
        width = width,
        height = height,
        {
          box = "vertical",
          border = "right",
          title = "{title} {live} {flags}",
          { win = "input", height = 1, border = "none" },
          { win = "list", border = "none" },
        },
        { win = "preview", title = "{preview}", border = "none" },
      },
    }
  end
end

require("snacks").setup({
  notifier = {
    enabled = true,
    icons = {
      error = "x",
      warn = "!",
      info = "i",
      debug = "*",
      trace = "?",
    },
  },
  picker = {
    win = {
      input = {
        keys = {
          ["<M-s>"] = { "flash", mode = { "n", "i" } },
          ["s"] = { "flash" },
        },
      },
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
        layout = with_preview,
        formatters = {
          file = { filename_only = true },
          severity = { pos = "right" },
        },
        win = {
          list = {
            keys = {
              ["<leader>/"] = function()
                closePicker()
                Snacks.picker.grep()
              end,
            },
          },
        },
      },
      keymaps = {
        layout = no_preview,
      },
    },
    layout = with_preview,
  },
})

vim.keymap.set("n", "<leader><leader>", function()
  closePicker()
  Snacks.picker.pickers()
end, { desc = "Find pickers" })

vim.keymap.set("n", "<BS>", function()
  closePicker()
  Snacks.picker.explorer()
end, { desc = "File explorer" })

vim.keymap.set("n", "<leader>e", function()
  closePicker()
  Snacks.picker.smart()
end, { desc = "Find files (smart)" })

vim.keymap.set("n", "<leader>.", function()
  closePicker()
  Snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>/", function()
  closePicker()
  Snacks.picker.grep_buffers()
end, { desc = "Grep in buffers" })

vim.keymap.set("n", "<leader>b/", function()
  closePicker()
  Snacks.picker.grep_buffers()
end, { desc = "Grep in buffers" })

vim.keymap.set("n", "<leader>/", function()
  closePicker()
  Snacks.picker.grep()
end, { desc = "Grep in project" })

vim.keymap.set("n", "<leader>d", function()
  closePicker()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer diagnostics" })

vim.keymap.set("n", "<leader>bd", function()
  closePicker()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer diagnostics" })

vim.keymap.set("n", "<leader>D", function()
  closePicker()
  Snacks.picker.diagnostics()
end, { desc = "Project diagnostics" })

vim.keymap.set("n", "<leader>bb", function()
  closePicker()
  Snacks.picker.buffers()
end, { desc = "Switch buffer" })
