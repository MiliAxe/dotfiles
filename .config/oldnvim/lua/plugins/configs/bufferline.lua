vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    always_show_bufferline = false,
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    mode = "buffers",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    separator_style = "thick"
  },
  
}
