-- Set leader key to space
vim.g.mapleader = " "

-- Enable line numbers
vim.wo.number = true

-- Confirm on exit
vim.opt.confirm = true

-- Show relative numbers
vim.o.relativenumber = true

-- Don't show mode information
vim.opt.showmode = false

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
