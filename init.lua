-- Set leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Load plugin configurations
require('config.plugins')

-- Load custom keybindings
require('config.keybindings')

