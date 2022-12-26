-- Set leader key to space
vim.g.mapleader = " "

-- Enable line numbers
vim.wo.number = true

-- Confirm on exit
vim.opt.confirm = true

-- Show relative numbers
vim.opt.relativenumber = true

-- Make the relative number on cursorline accept highlights
vim.opt.cursorline = true

-- Scroll earlier
vim.opt.scrolloff = 5

-- Don't show mode information
vim.opt.showmode = false

vim.g.neovide_padding_top=35
vim.g.neovide_padding_left=28
vim.g.neovide_padding_right=28
vim.g.neovide_padding_bottom=10

-- LATEX GLOBALS --
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- GuessIndent on save
vim.cmd [[autocmd BufWritePre <buffer> GuessIndent]]
