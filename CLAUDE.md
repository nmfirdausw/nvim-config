# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a modern Neovim configuration built with Neovim's built-in package manager (`vim.pack.add`) and modular Lua configuration. The setup provides comprehensive language support with automatic tool management through Mason.

## Architecture

### Entry Point
- `init.lua`: Main entry point that loads global utilities, options, and the lazy plugin manager
- Uses `_G.Utils = require("config.utils")` to provide global utility functions

### Plugin Management
- **Primary**: Uses Neovim's built-in `vim.pack.add()` for most dependencies
- **Lazy.nvim**: Only used for plugins requiring complex loading (imports from `lua/plugins/`)
- **Mason**: Automatic installation and management of LSP servers, formatters, and linters

### Configuration Structure
```
lua/config/
├── lazy.lua          # Lazy.nvim setup for complex plugins
├── options.lua       # Core Neovim settings
├── keymaps.lua       # Global key mappings with which-key integration
├── mason.lua         # Tool installation and management
├── lsp.lua           # LSP configuration and server setup
├── treesitter.lua    # Syntax highlighting configuration
├── formatting.lua    # Code formatting with conform.nvim
├── linting.lua       # Code linting with nvim-lint
├── completion.lua    # Completion system with blink.cmp
├── diagnostics.lua   # LSP diagnostics configuration
├── snacks.lua        # File picker, notifications, and utilities
├── roslyn.lua        # C# Roslyn LSP configuration
├── copilot.lua       # GitHub Copilot integration
├── git.lua           # Git integration and signs
├── utils.lua         # Utility functions (globally accessible)
└── [other configs]   # Additional feature configurations
```

## Development Workflow

### Adding Language Support

1. **LSP Server**: Add to Mason's `ensure_installed` list in `lua/config/mason.lua`
2. **Treesitter Parser**: Add to parsers list in `lua/config/treesitter.lua`
3. **Formatter**: Add to Mason's list and configure in `lua/config/formatting.lua`
4. **Linter**: Add to Mason's list and configure in `lua/config/linting.lua`

Mason automatically installs and configures most LSP servers without manual setup.

## Commit Convention

Use conventional commit format:
- `feat: add new feature`
- `fix: resolve bug`
- `refactor: restructure code`
- `docs: update documentation`
- `config: modify configuration`
- `chore: update dependencies`

Use bullet points for commit descriptions when necessary:
- Key changes or modifications
- Important notes or context
- Breaking changes if any

**IMPORTANT**: Never include attribution lines or mentions of AI assistance in commit messages. Keep commit messages clean and professional with only the actual changes described.