require("bufferline").setup{
  options = {
    numbers = "none",
    close_command = function(bufnum)
      require('bufdelete').bufdelete(bufnum, true)
    end,
    right_mouse_command = function(bufnum)
      require('bufdelete').bufdelete(bufnum, true)
    end,
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = false,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left" }},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = false, -- change this to false
    sort_by = 'id',
  }
}

