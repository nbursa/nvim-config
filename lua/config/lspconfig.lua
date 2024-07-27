local lspconfig = require('lspconfig')
local ts_utils = require('nvim-lsp-ts-utils')

-- Common on_attach function to enable mouse interactions
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  local buf_set_option = vim.api.nvim_buf_set_option
  buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Enable mouse interactions
  vim.opt.mouse = "a"

  -- Configure nvim-lsp-ts-utils
  ts_utils.setup({})
  ts_utils.setup_client(client)
end

-- Setup LSP for TypeScript
lspconfig.tsserver.setup({
  on_attach = on_attach,
  cmd = { "typescript-language-server", "--stdio" },
})

return {
  {
    "neovim/nvim-lspconfig",
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
      },
    },
  },
}
