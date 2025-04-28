local lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy,
  })
end
vim.opt.rtp:prepend(lazy)

require("lazy").setup({
  { 
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("config.nvimtree")
    end,
  },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { 
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.lualine")
    end,
  },
})