return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Example language server setups
      lspconfig.ts_ls.setup({})
      lspconfig.pyright.setup({})
      -- Add more language servers as needed
    end,
  },
}
