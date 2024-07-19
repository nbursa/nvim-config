-- Import the lspconfig module
local lspconfig = require('lspconfig')

-- Configure the language servers you want to use
-- Example configuration for a few popular language servers

-- Python
lspconfig.pyright.setup{}

-- TypeScript/JavaScript
lspconfig.tsserver.setup{}

-- Lua
lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Additional language servers can be configured here
