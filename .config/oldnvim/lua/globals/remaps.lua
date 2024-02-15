local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
local ls = require("luasnip")

-- nvim tree
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", default_opts);


-- bufferline
-- vim.api.nvim_set_keymap('n', 'gb', '<CMD>BufferLinePick<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap(
	"n",
	"<leader>ts", "<CMD>BufferLinePickClose<CR>",
	{ noremap = true, silent = true, desc = "Close the picked buffer" }
)
keymap("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", default_opts)
keymap("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", default_opts)

keymap(
	"n",
	"]b",
	"<CMD>BufferLineMoveNext<CR>",
	{ noremap = true, silent = true, desc = "Move current buffer back" }
)
keymap(
	"n",
	"[b",
	"<CMD>BufferLineMovePrev<CR>",
	{ noremap = true, silent = true, desc = "Move current buffer next" }
)
keymap(
	"n",
	"gs",
	"<CMD>BufferLineSortByDirectory<CR>",
	{ noremap = true, silent = true, desc = "Sort buffer by directory" }
)

keymap("i", "<C-k>", "<Plug>luasnip-next-choice", default_opts)
keymap("s", "<C-n>", "<Plug>luasnip-next-choice", default_opts)
keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", default_opts)
keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", default_opts)

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

local wk = require("which-key")
local dap = require("dap")
local ui = require("dapui")
-- local cmake = require("cmake-tools")

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
			f = {
				function()
					vim.lsp.buf.format();
				end,
				"Format current buffer"
			},
			s = { "<cmd>Telescope lsp_document_symbols", "Documents References" },
			d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" }
		},

		c = {
			name = "CMake",
			r = { "<cmd>CMakeRun<cr>", "Run" },
			g = { "<cmd>CMakeGenerate<cr>", "Generate" },
			d = {
				function()
					ui.toggle()
					vim.cmd("CMakeDebug")
				end,
				"Debug"
			},
			b = { "<cmd>CMakeBuild<cr>", "Build" },
			c = { "<cmd>CMakeClean<cr>", "Clean" },
			s = { "<cmd>CMakeStop<cr>", "Stop" }
		},

		d = {
			name = "DAP",
			s = {
				function()
					dap.continue()
					ui.toggle({})
					vim.api.nvim_feedkeys(
						vim.api.nvim_replace_termcodes("<c-w>=", false, true, true), "n", false)
				end,
				"Start session",
			},
			e = {
				function()
					dap.clear_breakpoints()
					ui.toggle({})
					dap.terminate()
					vim.api.nvim_feedkeys(
						vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
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
			u = {
				function()
					ui.toggle()
					require("notify")("UI Toggled", "warn")
				end,
				"Toggle UI",
			},
		},
		w = { "<cmd>write<cr>", "Write current buffer" },
		q = { "<cmd>quit<cr>", "Exit current buffer" },
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
		s = {
			function()
				require("silicon").visualise_cmdline({ to_clip = true })
			end,
			"Snap to clipboard",
		},
		T = {
			name = "Telescope",
			b = { "<cmd>Telescope buffers<cr>", "Buffers" }
		},
		t = {
			name = "Trouble",
			d = { "<cmd>Trouble doocument_diagnostics<cr>", "Diagnostics" },
			r = { "<cmd>Trouble lsp_references<cr>", "References" },
			q = { "<cmd>Trouble quickfix<cr>", "Quickfix" }
		}
	},
})
