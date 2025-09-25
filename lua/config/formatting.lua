-- ============================================================================
-- Formatters: Code formatting configuration and tool management
-- ============================================================================
-- Defines formatters to install, filetype mappings, and formatter-specific settings.

local M = {}

-- Formatters to install with MasonToolInstaller
-- Run :MasonToolsInstall to install them
M.install = {
  "stylua",
}

-- Filetype to formatter mappings
M.ftformatter = {
  lua = { "stylua" },
}

-- Formatter-specific configuration
M.formatters = {
  stylua = {
    args = {
      "--indent-type=Spaces",
      "--indent-width=2",
      "--quote-style=ForceDouble",
      "-",
    },
  },
}

return M
