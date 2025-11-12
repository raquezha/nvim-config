-- Set leader key to Space
vim.g.mapleader = " "

-- Telescope setup
require('telescope').setup{}

-- Harpoon 2 setup  
local harpoon = require('harpoon')
harpoon:setup()

-- Key mappings
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
