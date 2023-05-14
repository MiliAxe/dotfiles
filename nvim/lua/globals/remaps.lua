-- nvim tree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true })

-- bufferline
-- vim.api.nvim_set_keymap('n', 'gb', '<CMD>BufferLinePick<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap(
	"n",
	"<leader>ts",
	"<CMD>BufferLinePickClose<CR>",
	{ noremap = true, silent = true, desc = "Close the picked buffer" }
)
vim.api.nvim_set_keymap("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"]b",
	"<CMD>BufferLineMoveNext<CR>",
	{ noremap = true, silent = true, desc = "Move current buffer back" }
)
vim.api.nvim_set_keymap(
	"n",
	"[b",
	"<CMD>BufferLineMovePrev<CR>",
	{ noremap = true, silent = true, desc = "Move current buffer next" }
)
vim.api.nvim_set_keymap(
	"n",
	"gs",
	"<CMD>BufferLineSortByDirectory<CR>",
	{ noremap = true, silent = true, desc = "Sort buffer by directory" }
)

-- formating
-- vim.api.nvim_set_keymap('n', '<leader>f', '<CMD>lua vim.lsp.buf.format()<CR>',
-- 	{ noremap = true, silent = true, desc = "Format the current buffer" })
--
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

local wk = require("which-key")
local dap = require("dap")
local ui = require("dapui")

wk.register({
	["g"] = {
		d = {
			function()
				vim.lsp.buf.definition()
			end,
			"Go to definition",
		},
	},
	K = {
		function()
			vim.lsp.buf.hover()
		end,
		"Hover definition",
	},
	["<leader>"] = {
		l = {
			name = "LSP",
			a = { "<cmd>CodeActionMenu<cr>", "Code actions" },
		},
		d = {
			name = "DAP",
			s = {
				function()
					dap.continue()
					ui.toggle({})
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>=", false, true, true), "n", false)
				end,
				"Start session",
			},
			e = {
				function()
					dap.clear_breakpoints()
					ui.toggle({})
					dap.terminate()
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
					require("notify")("Debugger session ended", "warn")
				end,
				"End session",
			},
			c = {
				function()
					dap.continue()
				end,
				"Continue",
			},
			b = {
				function()
					dap.toggle_breakpoint()
				end,
				"Toggle breakpoint",
			},
			C = {
				function()
					dap.clear_breakpoints()
					require("notify")("Breakpoints cleared", "warn")
				end,
				"Clear breakpoints",
			},
		},
		w = { "<cmd>write<cr>", "Write current buffer" },
		t = {
			function()
				require("shade").toggle()
			end,
			"Toggle shade",
		},
		q = { "<cmd>quit<cr>", "Exit current buffer" },
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
		f = { "<cmd>Format<cr>", "Format the current buffer" },
		s = {
			function()
				require("silicon").visualise_cmdline({ to_clip = true })
			end,
			"Snap to clipboard",
		},
	},
})
