vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
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
