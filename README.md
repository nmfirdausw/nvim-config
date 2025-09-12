# Neovim Configuration

A modern Neovim configuration with comprehensive language support, featuring C#, TypeScript, Angular, PHP, and more.

## Dependencies

### Required
- **Neovim** >= 0.11.0
- **Node.js** >= 18.0 - Required for TypeScript/JavaScript language servers
- **npm** - Node package manager for installing language tools
- **Git** - Version control system

### Optional but Recommended
- **ripgrep** (`rg`) - Fast file searching and content grep
- **fd** (`fd-find`) - Fast file finding alternative to `find`
- **luarocks** - Lua package manager for Lua development
- **PHP** - Required for PHP language server and development
- **Composer** - PHP dependency manager for PHP projects

> **Note**: Language servers and formatters are automatically installed via Mason. Manual installation of these tools is not required, but having the base runtimes (Node.js, PHP) available will enable full language support.

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
    ├── formatting.lua         # Code formatting (biome, stylua, prettierd)
    ├── git.lua                # Git integration
    ├── icons.lua              # Centralized icon definitions
    ├── keymaps.lua            # Key mappings
    ├── linting.lua            # Code linting with nvim-lint
    ├── lsp.lua                # LSP setup and configuration
    ├── mason.lua              # Mason tool management
    ├── mini.lua               # Mini.ai text objects
    ├── neovide.lua            # Neovide GUI settings
    ├── options.lua            # Neovim options
    ├── roslyn.lua             # C# Roslyn LSP configuration
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
    "angular-language-server",
    "biome",
    "blade-formatter",
    "css-lsp",
    "css-variables-language-server",
    "cssmodules-language-server",
    "html-lsp",
    "lua-language-server",
    "prettierd",
    "roslyn",                      -- C# LSP server
    "rzls",                        -- Razor LSP server
    "stylua",
    "typescript-language-server",  -- TypeScript LSP server
  },
})
```

Mason will automatically install and configure the LSP server. No manual configuration files needed!

For available Mason packages, see: https://mason-registry.dev/registry/list

### 2. Add Treesitter Parser

In `lua/config/treesitter.lua`, add to parsers list:
```lua
local parsers = {
  "blade",                       -- Laravel Blade templates
  "c_sharp",                     -- C# support
  "css",
  "html",
  "lua",
  "luadoc", 
  "luap",
  "php",
  "razor",                       -- ASP.NET Razor pages
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
     angular = { "prettierd" },
     blade = { "blade-formatter" },
     css = { "biome-check" },
     html = { "prettierd" },
     javascript = { "biome-check" },
     json = { "biome-check" },
     lua = { "stylua" },
     typescript = { "biome-check" },
   }
   ```

## Features

### Core Features
- **Automatic Tool Management**: Mason handles LSP servers, formatters, and linters installation
- **File Picker**: Built-in file explorer and fuzzy finder with live preview
- **Modern Completion**: Blink.cmp with snippet support and AI integration (Copilot)
- **Smart Diagnostics**: Mode-aware display with toggle functionality
- **Advanced Folding**: Enhanced folding with preview capabilities  
- **Git Integration**: Visual git signs and hunk operations
- **Code Linting**: Automatic linting with nvim-lint on buffer write
- **Enhanced Text Objects**: Mini.ai for improved text manipulation
- **Custom UI**: Clean status column and notification system

### Language Support
- **C# Development**: Full Roslyn LSP integration with inlay hints and code lens
- **ASP.NET Razor**: Complete Razor page support with rzls
- **TypeScript/JavaScript**: Biome formatter and TypeScript LSP
- **Angular**: Dedicated Angular language server support
- **PHP/Laravel**: Blade template formatting and PHP LSP
- **Web Technologies**: HTML, CSS, JSON with appropriate formatters
- **Lua**: Optimized for Neovim configuration development

### Code Quality
- **Multi-formatter Support**: Biome, Prettier, Stylua, Blade formatter
- **Format on Save**: Automatic code formatting with language-specific tools
- **Consistent Styling**: Unified formatting rules across all supported languages

## Language-Specific Configuration

### C# Development

This configuration includes comprehensive C# support through Roslyn LSP:

- **Automatic Setup**: Roslyn and rzls are automatically installed via Mason
- **Inlay Hints**: Type hints for implicit variables, object creation, and parameters
- **Code Lens**: Reference counting and method signatures
- **Razor Support**: Full ASP.NET Razor page editing with syntax highlighting
- **Filetype Detection**: Automatic detection of `.razor` and `.cshtml` files

The C# configuration is handled by `lua/config/roslyn.lua` and includes:
- Custom Mason registry for Roslyn packages
- Automatic exclusion from mason-lspconfig to prevent conflicts
- Comprehensive inlay hint settings for better code readability

### Web Development

- **Biome Integration**: Fast formatting and linting for TypeScript, JavaScript, CSS, and JSON
- **Angular Support**: Dedicated language server for Angular projects
- **Blade Templates**: Laravel Blade template formatting and syntax highlighting
- **Multi-CSS Support**: CSS, SCSS with appropriate language servers

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
