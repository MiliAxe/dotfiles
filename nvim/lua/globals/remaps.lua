-- exit normal mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

-- nvim tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<cr>', { noremap = true })

-- code runner
vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

-- bufferline
-- vim.api.nvim_set_keymap('n', 'gb', '<CMD>BufferLinePick<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ts', '<CMD>BufferLinePickClose<CR>',
	{ noremap = true, silent = true, desc = "Close the picked buffer" })
vim.api.nvim_set_keymap('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', '<CMD>BufferLineMoveNext<CR>',
	{ noremap = true, silent = true, desc = "Move current buffer back" })
vim.api.nvim_set_keymap('n', '[b', '<CMD>BufferLineMovePrev<CR>',
	{ noremap = true, silent = true, desc = "Move current buffer next" })
vim.api.nvim_set_keymap('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>',
	{ noremap = true, silent = true, desc = "Sort buffer by directory" })

-- formating
vim.api.nvim_set_keymap('n', '<leader>f', '<CMD>lua vim.lsp.buf.format()<CR>',
	{ noremap = true, silent = true, desc = "Format the current buffer" })

local wk = require("which-key")

wk.register({
	["<localleader>"] = {
		l = {
			name = "+Latex"
		}
	},
	["<leader>"] = {
		w = { "<cmd>write<cr>", "Write current buffer" },
		r = { name = "+RunCode" },
		q = { "<cmd>quit<cr>", "Exit current buffer" },
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
	},
})
