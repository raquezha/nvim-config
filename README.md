# Neovim Config

Personal Neovim config built around Lazy.nvim, Telescope, Harpoon, NvimTree, Lualine, Alpha, Treesitter, and Lazygit.

## Dashboard

```text
                                                                       
                                                                       
   ██▀███   ▄▄▄       █▄▄▄▄ █    ██ ▓█████ ▒███████▒ ██░ ██  ▄▄▄     
  ▓██ ▒ ██▒▒████▄    ▓█░ ▀█ █    ██▓█   ▀ ▒ ▒ ▒ ▄▀░▓██░ ██▒▒████▄   
  ▓██ ░▄█ ▒▒██  ▀█▄  ▒█░ ▄█ ██  ▓██▒███   ░ ▒ ▄▀▒░ ▒██▀▀██░▒██  ▀█▄ 
  ▒██▀▀█▄  ░██▄▄▄▄██ ░█░  █ ▓██  ▒██▒▓█  ▄   ▄▀▒   ░░▓█ ░██ ░██▄▄▄▄██
  ░██▓ ▒██▒ ▓█   ▓██▒░█░  █ ▒██  ▒██░▒████▒▒███████▒░▓█▒░██▓ ▓█   ▓██
  ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒█   █ ▒▒   ░██░░ ▒░ ░░▒▒ ▓░▒░▒ ▒ ░░▒░▒ ▒▒   ▓▒█
    ░▒ ░ ▒░  ▒   ▒▒ ░░    █ ░   ▒ ░ ░ ░  ░░░▒ ▒ ░ ▒ ▒ ░▒░ ░  ▒   ▒▒ 
    ░░   ░   ░   ▒    ░  █  ░   ░     ░   ░ ░ ░ ▒ ░ ░  ░░ ░  ░   ▒  
     ░           ░  ░   ░        ░     ░  ░  ░ ░     ░  ░  ░      ░  
                                                                       
                       What are we gonna do today?                    
                                                                       
```

## Requirements

- **Neovim** >= 0.12
- **git**
- **ripgrep** - for Telescope `live_grep`
- **lazygit** - for `<leader>lg`
- **curl** and **tar**
- **C compiler** - `gcc`, `clang`, or equivalent
- **tree-sitter CLI** - for Treesitter parser installs/updates

### Arch / EndeavourOS

```bash
sudo pacman -S --needed neovim git ripgrep lazygit curl tar base-devel tree-sitter-cli
```

### macOS

Install Xcode Command Line Tools first if needed:

```bash
xcode-select --install
```

Then install dependencies with Homebrew:

```bash
brew install neovim git ripgrep lazygit tree-sitter
```

## Install

### Option 1: `curl | bash`

```bash
curl -fsSL https://raw.githubusercontent.com/raquezha/nvim-config/main/scripts/install.sh | bash
```

### Option 2: `git clone`

```bash
git clone https://github.com/raquezha/nvim-config.git ~/.config/nvim
nvim
```

### Option 3: Local symlink

Good for developing the config from a local checkout.

```bash
ln -sfn /path/to/nvim-config ~/.config/nvim
nvim
```

### Option 4: Test the install script against a local checkout

```bash
REPO_URL=/path/to/nvim-config bash ./scripts/install.sh
```

## First Launch

On first launch:
1. `lazy.nvim` bootstraps itself
2. plugins are downloaded
3. missing Treesitter parsers are installed

## Key Bindings

**Leader key:** `Space`

### File Navigation
- `<Space>ff` - find files
- `<Space>fg` - live grep
- `<Space>fb` - list buffers
- `<Space>fh` - help tags
- `<Space>fk` - find Kotlin files
- `<Space>e` - toggle file explorer

### Harpoon
- `<Space>ha` - add file
- `<Space>hm` - open Harpoon menu
- `<Space>h1-4` - jump to slots 1-4

### Git
- `<Space>lg` - open Lazygit
- `<Space>ll` - git log
- `<Space>lf` - file history

## Updating

### Update config

```bash
git -C ~/.config/nvim pull
```

### Update plugins

Inside Neovim:

```vim
:Lazy sync
```

### Update Treesitter parsers

Inside Neovim:

```vim
:TSUpdate
```

## Plugins

- **lazy.nvim** - plugin manager
- **telescope.nvim** - fuzzy finder
- **harpoon** - quick file navigation
- **lualine.nvim** - statusline
- **nvim-tree.lua** - file explorer
- **darcula-solid.nvim** - colorscheme
- **nvim-treesitter** - parser + Treesitter integration
- **snacks.nvim** - Lazygit integration
- **alpha-nvim** - startup dashboard

## Notes

- This config now targets modern Neovim (`0.12+`).
- Treesitter uses the current `nvim-treesitter` API.
- The old `opencode.nvim` integration was removed.
- Paths are based on `vim.fn.stdpath()`, so the config stays portable.
