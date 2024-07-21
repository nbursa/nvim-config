local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copy selected text to clipboard in visual mode
map('v', '<leader>y', '"+y', opts)

-- Copy the current line to clipboard
map('n', '<leader>Y', '"+yy', opts)

-- Copy the entire file content to clipboard
map('n', '<leader>ya', 'gg"+yG', opts)

-- NvimTree key mappings
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader>t', ':NvimTreeFocus<CR>', opts)

-- Telescope key mappings
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- LSP key mappings
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- Mouse mappings for LSP interactions
map('n', '<C-LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<C-RightMouse>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

