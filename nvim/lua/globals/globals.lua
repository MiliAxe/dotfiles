-- Set leader key to space
vim.g.mapleader = " "

-- Enable line numbers
vim.wo.number = true

vim.o.showtabline = 1

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

vim.o.guifont = "JetBrainsMono Nerd Font:h10"

vim.g.neovide_padding_top = 35
vim.g.neovide_padding_left = 28
vim.g.neovide_padding_right = 28
vim.g.neovide_padding_bottom = 10

-- LATEX GLOBALS --
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})]]

-- GuessIndent on save
-- vim.cmd [[autocmd BufWritePre <buffer> GuessIndent]]

-- vim.cmd [[autocmd InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = { "*.cs" },
	callback = function()
		vim.lsp.codelens.refresh()
	end
})
