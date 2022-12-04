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

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- GuessIndent on save
vim.cmd [[autocmd BufWritePre <buffer> GuessIndent]]
