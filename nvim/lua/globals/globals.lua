vim.g.mapleader = " "
vim.wo.number = true
vim.o.relativenumber = true

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
