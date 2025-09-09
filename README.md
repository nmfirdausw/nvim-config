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

> **Note**: Language servers and formatters are automatically installed via Mason. Manual installation is not required.

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
└── lua/config/
    ├── completion.lua          # Completion system (blink.cmp)
    ├── copilot.lua            # GitHub Copilot integration  
    ├── dependencies.lua        # Plugin dependencies only
    ├── diagnostics.lua         # Diagnostic settings
    ├── folding.lua            # Code folding
    ├── formatting.lua         # Code formatting
    ├── git.lua                # Git integration
    ├── icons.lua              # Centralized icon definitions
    ├── keymaps.lua            # Key mappings
    ├── lsp.lua                # LSP setup
    ├── mason.lua              # Mason tool management
    ├── mini.lua               # Mini.ai text objects
    ├── neovide.lua            # Neovide GUI settings
    ├── options.lua            # Neovim options
    ├── snacks.lua             # Picker, notifications, and utilities
    ├── statuscolumn.lua       # Custom status column
    ├── treesitter.lua         # Syntax highlighting
    └── utils.lua              # Utility functions
```

## Adding Language Support

### 1. Add LSP Server

Add the server name to Mason's ensure_installed list in `lua/config/mason.lua`:
```lua
require("mason-tool-installer").setup({
  ensure_installed = {
    "css-lsp",
    "html-lsp", 
    "lua-language-server",
    "typescript-language-server", -- Add new LSP server
    "stylua",
  },
})
```

Mason will automatically install and configure the LSP server. No manual configuration files needed!

For available Mason packages, see: https://mason-registry.dev/registry/list

### 2. Add Treesitter Parser

In `lua/config/treesitter.lua`, add to parsers list:
```lua
local parsers = {
  "lua",
  "luadoc", 
  "luap",
  "html",
  "css",
  "scss",
  "typescript", -- Add new parser
  "javascript",
}
```

### 3. Add Formatter

1. Add formatter to Mason's ensure_installed list in `lua/config/mason.lua`:
   ```lua
   ensure_installed = {
     -- ... other tools
     "prettierd", -- Add formatter
   }
   ```

2. Configure formatter in `lua/config/formatting.lua`:
   ```lua
   formatters_by_ft = {
     lua = { "stylua" },
     typescript = { "prettierd" }, -- Add formatter
     javascript = { "prettierd" },
   }
   ```

## Features

- **Automatic Tool Management**: Mason handles LSP servers, formatters, and linters installation
- **File Picker**: Built-in file explorer and fuzzy finder with live preview
- **Modern Completion**: Blink.cmp with snippet support and AI integration (Copilot)
- **Smart Diagnostics**: Mode-aware display with toggle functionality
- **Advanced Folding**: Enhanced folding with preview capabilities  
- **Git Integration**: Visual git signs and hunk operations
- **Code Formatting**: Automatic formatting with Mason-managed tools
- **Enhanced Text Objects**: Mini.ai for improved text manipulation
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
