vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- require("indent_blankline").setup {
--     space_char_blankline = " ",
--     show_current_context = true,
--     show_current_context_start = true,
-- }
require("indent_blankline").setup({
    show_trailing_blankline_indent = false,
    -- show_first_indent_level = false,
    show_current_context = true,
    -- show_current_context_start = true,
})

require('indent-o-matic').setup {
    -- The values indicated here are the defaults

    -- Number of lines without indentation before giving up (use -1 for infinite)
    max_lines = 2048,

    -- Space indentations that should be detected
    standard_widths = { 2, 4, 8 },

    -- Skip multi-line comments and strings (more accurate detection but less performant)
    skip_multiline = true,
}
