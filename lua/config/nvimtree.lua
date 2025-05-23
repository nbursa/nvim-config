require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

vim.api.nvim_create_autocmd({ "VimEnter" }, { 
  callback = function()
    require("nvim-tree.api").tree.open()
  end 
})