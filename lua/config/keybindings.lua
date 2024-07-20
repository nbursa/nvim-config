local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copy selected text to clipboard in visual mode
map('v', '<leader>y', '"+y', opts)

-- Copy the current line to clipboard
map('n', '<leader>Y', '"+yy', opts)

-- Copy the entire file content to clipboard
map('n', '<leader>ya', 'gg"+yG', opts)

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader>t', ':NvimTreeFocus<CR>', opts)

map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
