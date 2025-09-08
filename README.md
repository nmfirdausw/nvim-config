# Neovim Configuration

A minimal Neovim configuration focused on Lua development with modern features.

## Dependencies

### Required
- **Neovim** >= 0.11.0
- **Node.js** >= 18.0
- **Git**

### Optional but Recommended
- **ripgrep** (`rg`) - Fast file searching
- **fd** (`fd-find`) - Fast file finding
- **stylua** - Lua code formatter
- **lua-language-server** - Lua LSP server

## Installation

1. Backup existing configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this configuration:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lsp/
│   └── lua_ls.lua             # Lua LSP configuration
└── lua/config/
    ├── dependencies.lua        # Plugin dependencies only
    ├── diagnostics.lua         # Diagnostic settings
    ├── folding.lua            # Code folding
    ├── formatting.lua         # Code formatting
    ├── git.lua                # Git integration
    ├── keymaps.lua            # Key mappings
    ├── lsp.lua                # LSP setup
    ├── neovide.lua            # Neovide GUI settings
    ├── options.lua            # Neovim options
    ├── snacks.lua             # Notifications
    ├── statuscolumn.lua       # Custom status column
    ├── treesitter.lua         # Syntax highlighting
    └── utils.lua              # Utility functions
```

## Adding Language Support

### 1. Add LSP Server

Create LSP configuration in `lsp/`:
```lua
-- lsp/tsserver.lua
return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "javascript" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}
```

Enable LSP in `lua/config/lsp.lua`:
```lua
vim.lsp.enable({
  "lua_ls",
  "tsserver", -- Add your new LSP
})
```

For LSP server installation and configuration details, see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

### 2. Add Treesitter Parser

In `lua/config/treesitter.lua`, add to parsers list:
```lua
local parsers = {
  "lua",
  "luadoc", 
  "luap",
  "typescript", -- Add new parser
  "javascript",
}
```

### 3. Add Formatter

In `lua/config/formatting.lua`, add to formatters:
```lua
formatters_by_ft = {
  lua = { "stylua" },
  typescript = { "prettierd" }, -- Add formatter
  javascript = { "prettierd" },
  python = { "black" },
}
```

## Features

- **Smart Diagnostics**: Mode-aware display with toggle functionality
- **Advanced Folding**: Enhanced folding with preview capabilities  
- **Git Integration**: Visual git signs and hunk operations
- **Code Formatting**: Automatic formatting with stylua integration
- **Custom UI**: Clean status column and notification system

## Customization

### Adding Plugins

1. Create a new plugin configuration file in `lua/config/`:
   ```lua
   -- lua/config/myplugin.lua
   vim.pack.add({ "https://github.com/author/plugin-name" })
   
   require("plugin-name").setup({
     -- plugin configuration
   })
   ```

2. Require it in `init.lua`:
   ```lua
   require("config.myplugin")
   ```

### Modifying Settings

- **Editor options**: `lua/config/options.lua`
- **Key mappings**: `lua/config/keymaps.lua` 
- **Plugin configs**: Individual files in `lua/config/`

## Neovide Support

Includes optimized settings for Neovide GUI with consistent padding, refresh rates, and visual enhancements.
