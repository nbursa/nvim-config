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
      'kyazdani42/nvim-web-devicons',
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
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('config.lspconfig')
    end
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim" -- for VSCode-like pictograms
    },
    config = function()
      require('config.cmp')
    end
  },
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require('config.telescope')
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('config.lualine')
    end
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('config.kanagawa')
    end
  }
})

