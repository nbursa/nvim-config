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

require("lazy").setup({
  spec = {
    -- Import your plugins from the plugins directory
    { import = "plugins" },
  },
  -- Automatically check for plugin updates
  checker = { enabled = true },

  -- Enable notifications for plugin updates and other events
  notifications = {
    enabled = true,
    level = vim.log.levels.INFO,
  },

  -- UI and performance settings
  install = { colorscheme = { "catppuccin" } },
  performance = {
    cache = { enabled = true },
    rtp = {
      reset = false,
      disabled_plugins = { "gzip", "tarPlugin", "zipPlugin", "netrwPlugin" },
    },
  },
  ui = {
    border = "rounded",
  },
})
