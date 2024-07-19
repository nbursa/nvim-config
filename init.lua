-- Load lazy.nvim
vim.cmd [[packadd lazy.nvim]]

require('lazy').setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require('config.whichkey')
    end,
  },
  {
    "echasnovski/mini.icons",
  },
  {
    "kyazdani42/nvim-web-devicons",
  },
  {
    "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('config.nvimtree')
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('config.treesitter')
    end
  }
})
