# Neovim Config

Personal Neovim configuration with Lazy.nvim, Telescope, Harpoon, and Lazygit.

## Prerequisites

- **Neovim** >= 0.9.0
- **Git**
- **Lazygit** (for git integration)
  - Mac: `brew install lazygit`
  - Windows: Download from [releases](https://github.com/jesseduffield/lazygit/releases)
- **ripgrep** (for Telescope live_grep)
  - Mac: `brew install ripgrep`
  - Windows: `choco install ripgrep` or `scoop install ripgrep`

## Installation

### One-Command Setup (Mac/Linux)
```bash
git clone https://github.com/raquezha/nvim-config.git ~/.config/nvim
nvim
```

### Windows (PowerShell)
```powershell
git clone https://github.com/raquezha/nvim-config.git $env:LOCALAPPDATA\nvim
nvim
```

**That's it!** On first launch:
1. Lazy.nvim auto-installs itself
2. All plugins auto-download
3. Treesitter parsers auto-install

## Key Bindings

**Leader Key:** `Space`

### File Navigation
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search in files)
- `<Space>fb` - List buffers
- `<Space>fh` - Help tags
- `<Space>fk` - Find Kotlin files
- `<Space>e` - Toggle file explorer

### Harpoon (Quick Navigation)
- `<Space>ha` - Add file to harpoon
- `<Space>hm` - Show harpoon menu
- `<Space>h1-4` - Jump to harpoon file 1-4

### Git (Lazygit)
- `<Space>lg` - Open Lazygit
- `<Space>ll` - Git log
- `<Space>lf` - File history

## Updating

### Update Config
```bash
cd ~/.config/nvim
git pull
```

### Update Plugins
Inside Neovim: `:Lazy update`

## Plugin List

- **lazy.nvim** - Plugin manager
- **telescope.nvim** - Fuzzy finder
- **harpoon** - Quick file navigation
- **lualine.nvim** - Status line
- **nvim-tree.lua** - File explorer
- **darcula-solid.nvim** - Color scheme
- **nvim-treesitter** - Syntax highlighting
- **snacks.nvim** - Lazygit integration

## Platform Notes

This config works cross-platform (Mac, Linux, Windows). Paths are automatically handled using `vim.fn.stdpath()`.
