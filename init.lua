vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Basics
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.mouse = 'a'
vim.cmd 'syntax on'

-- Load configs
require('config.keymaps')
require('config.plugins')
