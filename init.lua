-- Set leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Enable filetype detection
vim.cmd 'filetype on'
vim.cmd 'filetype plugin on'
vim.cmd 'filetype indent on'

-- Enable syntax highlighting
vim.cmd 'syntax on'

-- Enable wrap and disable horizontal scrolling
vim.opt.wrap = true
vim.opt.sidescrolloff = 0

vim.api.nvim_exec([[
  augroup BufferlineCustomCSS
    autocmd!
    autocmd VimEnter * call AddBufferlineCSS()
  augroup END

  function! AddBufferlineCSS() abort
    if exists(':hi')
      highlight BufferlineBufferIconSelected guibg=#1e1e1e gui=bold guifg=#ffffff
      highlight BufferlineBufferCloseIcon guibg=#1e1e1e guifg=#ffffff
      highlight BufferlineBufferModifiedIcon guibg=#1e1e1e guifg=#ffffff
    endif
  endfunction
]], false)

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0) == "" then
      vim.cmd("quit")
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require('config.keybindings')
  end
})

-- Set highlight groups
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })

-- Load custom keybindings
require('config.keybindings')

-- Load plugin configurations
require('config.plugins')

