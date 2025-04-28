local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "q", "<Nop>", opts)

-- Tree
map('n', 'tt', ':NvimTreeToggle<CR>', opts)

-- Telescope
map('n', 'ff', "<cmd>Telescope find_files<cr>", opts)
map('n', 'fg', "<cmd>Telescope live_grep<cr>", opts)

-- Buffers
map('n', 'qq', ':bd<CR>', opts)
map('n', 'ss', ':w<CR>', opts)

-- Window movements
map('n', 'sv', ':vsplit<CR>', opts)
map('n', 'sh', ':split<CR>', opts)
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>l', '<C-w>l', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>j', '<C-w>j', opts)
