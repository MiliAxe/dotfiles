local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "kyazdani42/nvim-web-devicons" },

	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.configs.nvim-tree")
		end,
		cmd = "NvimTreeToggle",
	},

	{ "lewis6991/impatient.nvim" },

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("plugins.configs.colorizer")
		end,
	},

	{ "neovim/nvim-lspconfig" },

	{
		"nimaaskarian/pywal16.nvim",
		name = "pywal",
		-- config = 'require("plugins.configs.pywal")'
		dependencies = {

			{
				"lukas-reineke/indent-blankline.nvim",
				config = function()
					require("plugins.configs.indent-blankline")
				end,
			},
		}
	},


	-- Bottom statusbar
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
		event = "VimEnter"
	},

	{
		"akinsho/toggleterm.nvim",
		version = "v2.*",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},

	{ "andweeb/presence.nvim", config = 'require("plugins.configs.presence")' },

	{ "nvim-lua/plenary.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.configs.telescope")
		end,
		cmd = "Telescope",
		dependencies = {

			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
		}
	},


	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},


	-- use 'Darazaki/indent-o-matic'

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = "BufReadPre",
	},

	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.configs.bufferline")
		end,
	},


	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.configs.cmp")
		end,
		dependencies = {

			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "octaltree/cmp-look" },
			{ "hrsh7th/cmp-calc" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-emoji" },
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp" },

			-- {
			-- 	"rafamadriz/friendly-snippets",
			--
			-- 	config = function()
			-- 		require("loaders.from_vscode").load()
			-- 	end,
			--
			--
			-- },
			--

			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup({})
				end,
				-- after = "InsertEnter",
			},
			{
				"L3MON4D3/LuaSnip",

				-- dependencies = {
				-- 	{
				-- 		"rafamadriz/friendly-snippets",
				--
				-- 		config = function()
				-- 			require("luasnip.loaders.from_vscode").lazy_load()
				-- 		end,
				-- 	},
				-- }
			},
			{
				"rafamadriz/friendly-snippets",

				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		}
	},

	-- {
	-- 	"L3MON4D3/LuaSnip",
	--
	-- 	dependencies = {
	-- 		{
	-- 			"rafamadriz/friendly-snippets",
	--
	-- 			config = function()
	-- 				require("luasnip.loaders.from_vscode").lazy_load()
	-- 			end,
	-- 		},
	-- 	}
	-- },

	-- {
	-- 	"mhartington/formatter.nvim",
	-- 	config = function()
	-- 		require("plugins.configs.formatter")
	-- 	end,
	-- },

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.null-ls")
		end,
	},

	{ "folke/lsp-colors.nvim" },

	-- use "glepnir/dashboard-nvim"
	-- {
	-- 	"startup-nvim/startup.nvim",
	-- 	--requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("startup").setup(require("plugins.configs.startup_nvim"))
	-- 	end,
	-- },

	{
		'goolord/alpha-nvim',
		event = "VimEnter",
		config = function()
			require("plugins.configs.alpha")
		end
	},


	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		-- dependencies = {
		-- 	{ "jayp0521/mason-nvim-dap.nvim" },
		-- }
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.configs.mason")
		end,
	},

	{ "navarasu/onedark.nvim", lazy = true },

	{ "matze/vim-move" },

	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
		keys = { "<leader>", "\\" }
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"lervag/vimtex",
		config = function()
			require("plugins.configs.vimtex")
		end,
		ft = { "tex" }
	},

	{ "rcarriga/nvim-notify" },

	{
		"narutoxy/silicon.lua",
		config = function()
			require("plugins.configs.silicon")
		end,
		keys = { "<leader>", "s" }

	},

	{
		"iamcco/markdown-preview.nvim",
		config = function() vim.fn["mkdp#util#install"]() end,
		ft = "markdown"
	},

	{ "dstein64/vim-startuptime" },

	{
		"lambdalisue/suda.vim",
		cmd = { "SudaWrite", "SudaRead" }
	},

	{
		"SmiteshP/nvim-navic",
	},

	-- {
	-- 	"fgheng/winbar.nvim",
	-- 	config = function()
	-- 		require("plugins.configs.winbar")
	-- 	end,
	-- 	event = "BufRead",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 	}
	-- },

	-- use({ "sunjon/shade.nvim", event = "BufRead", config = 'require("plugins.configs.shade")' })

	-- use({
	-- 	"rktjmp/fwatch.nvim",
	-- 	config = 'require("plugins.configs.fwatch")',
	-- })


	-- "Pocco81/DAPInstall.nvim",
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.configs.dap")
		end,
		lazy = true,
		-- keys = {"<leader>ds"},
		dependencies = {
			"rcarriga/nvim-dap-ui",

		}
	},

	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},

	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = "BufReadPre",
		config = function()
			require("plugins.configs.illuminate")
		end,
	},

	{
		"phaazon/hop.nvim",
		lazy = true,
		-- you can configure Hop the way you like here; see :h hop-config
		config = function()
			require("plugins.configs.hop")
		end,
	},

	{
		"Darazaki/indent-o-matic",
	},

	-- {
	-- 	"Hoffs/omnisharp-extended-lsp.nvim",
	-- 	ft = "cs"
	-- },

	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end
	},

	{
		'kevinhwang91/nvim-ufo',
		-- event = "BufReadPre",
		dependencies = {
			'kevinhwang91/promise-async',

			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
							{ text = { "%s" },                  click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			}

		},
		config = function()
			require("plugins.configs.ufo")
		end
	},

	{
		'Civitasv/cmake-tools.nvim',
		config = function()
			require("plugins.configs.cmake-tools")
		end,
		event = "BufReadPost"
	},

	{
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			config = function()
				require("plugins.configs.lsp_signature")
			end
		}
	}
})
