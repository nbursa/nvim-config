return {
  -- LSP and completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Fuzzy finder and Grep
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-n>"] = require('telescope.actions').move_selection_next,
              ["<C-p>"] = require('telescope.actions').move_selection_previous,
            },
          },
        },
      }
    end,
  },

  -- Git integration
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },

  -- Treesitter for enhanced syntax highlighting
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- File explorer
  { 
    "nvim-tree/nvim-tree.lua",
    config = function()
      require'nvim-tree'.setup {
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        view = {
          width = 30,
          side = 'left',
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        renderer = {
          highlight_opened_files = "name",
        },
        filters = {
          dotfiles = false,
        },
      }
      vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },

  -- Status line
  { 
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          section_separators = {'', ''},
          component_separators = {'', ''},
          icons_enabled = true,
        }
      }
    end,
  },

  -- Which Key
  { 
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  },
}
