-- Set leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Load plugin configurations
require('config.plugins')

-- Load custom keybindings
require('config.keybindings')

