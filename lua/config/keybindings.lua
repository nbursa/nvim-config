local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copy selected text to clipboard in visual mode
map('v', '<leader>y', '"+y', opts)

-- Copy the current line to clipboard
map('n', '<leader>Y', '"+yy', opts)

-- Copy the entire file content to clipboard
map('n', '<leader>ya', 'gg"+yG', opts)
