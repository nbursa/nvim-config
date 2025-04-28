local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General keymaps
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- Git keymaps
map('n', '<leader>gs', ':G<CR>', opts)

-- LSP keymaps
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

-- Disable single 'q' to prevent accidental macro recording
vim.keymap.set("n", "q", "<Nop>", opts)

-- Speedups
map('n', 'qq', ':bd<CR>', opts) -- quick quit
map('n', 'ss', ':w<CR>', opts) -- quick save
map('n', 'tt', ':NvimTreeToggle<CR>', opts) -- toggle NvimTree
map('n', 'sv', ':vsplit<CR>', opts) -- vertical split
map('n', 'sh', ':split<CR>', opts) -- horizontal split
map('n', '<leader>h', '<C-w>h', opts) -- move left split
map('n', '<leader>l', '<C-w>l', opts) -- move right split
map('n', '<leader>k', '<C-w>k', opts) -- move up split
map('n', '<leader>j', '<C-w>j', opts) -- move down split
