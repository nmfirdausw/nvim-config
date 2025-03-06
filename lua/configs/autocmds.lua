function LoadGitPlugin() end

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  desc = "Set cmdheight to 1",
  group = vim.api.nvim_create_augroup("cmdline-add-height", { clear = true }),
  callback = function()
    vim.opt.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  desc = "Set cmdheight to 1",
  group = vim.api.nvim_create_augroup("cmdline-remove-height", { clear = true }),
  callback = function()
    vim.opt.cmdheight = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("disable-status-column", { clear = true }),
  pattern = "help",
  callback = function()
    vim.opt_local.statuscolumn = ""
  end,
})

local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      for _, client in ipairs(vim.lsp.get_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.api.nvim_set_option_value("filetype", "html", {
            buf = args.buf,
          })
          vim.api.nvim_set_option_value("syntax", "html", {
            buf = args.buf,
          })
          vim.api.nvim_set_option_value("filetype", "blade", {
            buf = args.buf,
          })
          vim.api.nvim_set_option_value("syntax", "blade", {
            buf = args.buf,
          })
          break
        end
      end
    end)
  end,
})

vim.api.nvim_exec2("autocmd FileType php set iskeyword+=$", {})
