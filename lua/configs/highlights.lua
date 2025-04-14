local fg1 = "#EED2AD"
local fg2 = "#7f8182"
local fg3 = "#576c78"
local fg4 = "#A48A73"
local fg5 = "#40464C"
local bg1 = "#0E1317"
local bg2 = "#1d2326"
local green = "#A8C080"
local yellow = "#E7B06D"
local red = "#D77D7D"
local cyan = "#7EC8C4"
local blue = "#4A7D8C"

vim.api.nvim_set_hl(0, "Normal", { bg = bg1, fg = fg2 })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg1, fg = fg2 })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg1, fg = fg5 })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = bg1, fg = fg2 })
vim.api.nvim_set_hl(0, "StatusLine", { bg = bg1, fg = fg2 })
vim.api.nvim_set_hl(0, "StatusLineNC", {})
vim.api.nvim_set_hl(0, "LineNr", { fg = fg5 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = fg1, bold = true })
vim.api.nvim_set_hl(0, "NonText", { fg = fg5 })
vim.api.nvim_set_hl(0, "SignColumn", { fg = fg5 })
vim.api.nvim_set_hl(0, "Comment", { fg = fg5, italic = true })
vim.api.nvim_set_hl(0, "Function", { fg = fg1, italic = true, nocombine = true })
vim.api.nvim_set_hl(0, "Statement", { fg = fg4 })
vim.api.nvim_set_hl(0, "String", { fg = fg3 })
vim.api.nvim_set_hl(0, "Delimiter", { fg = fg4 })
vim.api.nvim_set_hl(0, "Special", { fg = fg4 })
vim.api.nvim_set_hl(0, "Constant", { fg = fg1 })
vim.api.nvim_set_hl(0, "Operator", { fg = fg4 })
vim.api.nvim_set_hl(0, "Directory", { fg = fg4 })
vim.api.nvim_set_hl(0, "MiniPickPrompt", { fg = fg1 })
vim.api.nvim_set_hl(0, "MiniPickMatchRanges", { fg = fg1 })
vim.api.nvim_set_hl(0, "Visual", { bg = bg2 })
vim.api.nvim_set_hl(0, "Type", { fg = fg1 })
vim.api.nvim_set_hl(0, "PhpMethods", { fg = fg2 })
vim.api.nvim_set_hl(0, "Pmenu", { fg = fg2 })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = bg2 })
vim.api.nvim_set_hl(0, "PmenuMatchSel", { bg = bg2 })
vim.api.nvim_set_hl(0, "MatchParen", { fg = fg1, bold = true })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = cyan })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = blue })
vim.api.nvim_set_hl(0, "DiagnosticOk", { fg = green })

vim.api.nvim_set_hl(0, "OilDir", { link = "OilFile" })
vim.api.nvim_set_hl(0, "OilDirIcon", { link = "Directory" })

vim.api.nvim_set_hl(0, "BlinkCmpKindText", { link = "String" })
vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { link = "Function" })
vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindField", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { link = "String" })
vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { link = "String" })
vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { link = "String" })
vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindColor", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { link = "Directory" })
vim.api.nvim_set_hl(0, "BlinkCmpKindReference", { link = "Directory" })
vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { link = "Directory" })
vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { link = "Variable" })
vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", { link = "Special" })
vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { link = "Operator" })
vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", { link = "Operator" })
vim.api.nvim_set_hl(0, "BlinkCmpSource", { link = "Normal" })

vim.api.nvim_set_hl(0, "@variable", { fg = fg1 })
vim.api.nvim_set_hl(0, "@property", { fg = fg2, nocombine = true })
vim.api.nvim_set_hl(0, "@variable.member.lua", { fg = fg2, bold = false, nocombine = true })
vim.api.nvim_set_hl(0, "@constant.lua", { fg = fg1, bold = false })
vim.api.nvim_set_hl(0, "@number.lua", { fg = fg3 })
vim.api.nvim_set_hl(0, "@boolean.lua", { fg = fg1, italic = true })
vim.api.nvim_set_hl(0, "@function.builtin.lua", { fg = fg1, italic = true })

vim.api.nvim_set_hl(0, "@module.php", { fg = fg2 })
vim.api.nvim_set_hl(0, "@variable.php", { fg = fg2 })
vim.api.nvim_set_hl(0, "@variable.builtin.php", { fg = fg2 })
vim.api.nvim_set_hl(0, "@variable.member.php", { fg = fg2 })
vim.api.nvim_set_hl(0, "@type.php", { fg = fg1 })
vim.api.nvim_set_hl(0, "@attribute.php", { fg = fg1 })
vim.api.nvim_set_hl(0, "@function.method.php", { fg = fg2, italic = true })
vim.api.nvim_set_hl(0, "@function.call.php", { fg = fg2, italic = true })
vim.api.nvim_set_hl(0, "@function.method.call.php", { fg = fg2, italic = true })

vim.api.nvim_set_hl(0, "@tag.attribute.html", { fg = fg1 })

vim.api.nvim_set_hl(0, "@tag.blade", { link = "@none" })
vim.api.nvim_set_hl(0, "@tag.delimiter.blade", { link = "@none" })
