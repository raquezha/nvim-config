-- ============================================================================
-- Lazy.nvim Bootstrap (Auto-installs lazy.nvim if not present)
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Basic Neovim Settings
-- ============================================================================
vim.g.mapleader = " "  -- Set leader key to Space
vim.opt.number = true
vim.opt.relativenumber = false  -- Fixed line numbers (not relative)
vim.opt.cursorline = true
vim.opt.background = 'dark'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.scrolloff = 8  -- Smooth scrolling - keep 8 lines visible

-- ============================================================================
-- Plugin Setup with Lazy.nvim
-- ============================================================================
require("lazy").setup({
  -- Dependencies (required by other plugins)
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  
  -- Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 
          "lua", "vim", "vimdoc",
          "kotlin", "java",
          "python", "javascript", "typescript",
          "html", "css", "json", "yaml",
          "bash", "markdown", "markdown_inline",
          "git_config", "git_rebase", "gitcommit", "gitignore"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  
  -- Darcula Theme
  {
    "briones-gabriel/darcula-solid.nvim",
    lazy = false,     -- Load immediately, not lazy
    priority = 1000,  -- Load theme first
    dependencies = { 
      { "rktjmp/lush.nvim", lazy = false }
    },
    config = function()
      require("darcula").setup({
        opt = {
          integrations = {
            telescope = true,
            lualine = true,
            lsp_semantics_token = true,
            nvim_cmp = true,
            dap_nvim = true,
          },
        },
      })
      vim.cmd('colorscheme darcula-solid')
      vim.cmd('syntax on')
    end,
  },
  
  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key"
            }
          },
          file_ignore_patterns = {
            "build/",
            "%.class$",
            "node_modules/",
            "%.gradle/",
            "target/",
            "dist/",
            "%.jar$",
            "%.war$",
            "%.ear$",
          },
        }
      }
    end,
  },
  
  -- Harpoon 2 (quick file navigation)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  
  -- Lualine (status bar)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup({
        options = { theme = 'auto' },  -- Auto theme works with darcula integration
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      })
    end,
  },
  
  -- NvimTree (file explorer)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('nvim-tree').setup({
        view = {
          side = 'left',  -- Open on the left side
          width = 30,
        },
      })
    end,
  },
  
  -- Snacks.nvim (for lazygit integration)
  {
    "folke/snacks.nvim",
    config = function()
      require('snacks').setup({
        lazygit = {
          configure = true,
          config = {
            os = { editPreset = "nvim-remote" },
            gui = {
              nerdFontsVersion = "3",
            },
          },
          theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
          theme = {
            [241]                      = { fg = "Special" },
            activeBorderColor          = { fg = "MatchParen", bold = true },
            cherryPickedCommitBgColor  = { fg = "Identifier" },
            cherryPickedCommitFgColor  = { fg = "Function" },
            defaultFgColor             = { fg = "Normal" },
            inactiveBorderColor        = { fg = "FloatBorder" },
            optionsTextColor           = { fg = "Function" },
            searchingActiveBorderColor = { fg = "MatchParen", bold = true },
            selectedLineBgColor         = { bg = "Visual" },
            unstagedChangesColor       = { fg = "DiagnosticError" },
          },
          win = {
            style = "lazygit",
          },
        }
      })
    end,
  },
})

-- ============================================================================
-- Key Mappings
-- ============================================================================
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope find_files search_file=*.kt<cr>', opts)

-- Harpoon 2
local harpoon = require('harpoon')
harpoon:setup()
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, opts)
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, opts)
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, opts)
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, opts)
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, opts)

-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

-- Lazygit
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, opts)
vim.keymap.set("n", "<leader>ll", function() Snacks.lazygit.log() end, opts)
vim.keymap.set("n", "<leader>lf", function() Snacks.lazygit.log_file() end, opts)
