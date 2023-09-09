-- Make packer's window floating
-- require("packer").init({
-- 	display = {
-- 		open_fn = function()
-- 			return require("packer.util").float({ border = "rounded" })
-- 		end,
-- 	},
-- })

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
		event = "BufRead",
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
		dependencies = {
			{ "jayp0521/mason-nvim-dap.nvim" },
		}
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
	},

	{ "dstein64/vim-startuptime" },

	{
		"lambdalisue/suda.vim",
		cmd = { "SudaWrite", "SudaRead" }
	},

	{
		"fgheng/winbar.nvim",
		config = function()
			require("plugins.configs.winbar")
		end,
		event = "BufRead",
		dependencies = {
			"SmiteshP/nvim-navic",
		}
	},

	-- use({ "sunjon/shade.nvim", event = "BufRead", config = 'require("plugins.configs.shade")' })

	-- use({
	-- 	"rktjmp/fwatch.nvim",
	-- 	config = 'require("plugins.configs.fwatch")',
	-- })


	"Pocco81/DAPInstall.nvim",
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

	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		ft = "cs"
	},

	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end
	},

	{
		'kevinhwang91/nvim-ufo',
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
	}


})


-- Automatically run :PackerSync when update plugins list
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost init.lua source <afile> | PackerSync
--   augroup end
-- ]])


-- Plugins List
--[[
return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugins.configs.nvim-tree")
		end,
		tag = "nightly",
	})

	--colorcode show
	-- use 'NvChad/nvim-colorizer.lua'
	use({
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("plugins.configs.colorizer")
		end,
	})

	--lsp configurator
	use("neovim/nvim-lspconfig")

	-- Pywal colorscheme
	use({
		"AlphaTechnolog/pywal.nvim",
		as = "pywal",
		-- config = 'require("plugins.configs.pywal")'
	})

	-- Bottom statusbar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.configs.lualine")
		end,
	})

	use({ "akinsho/toggleterm.nvim", tag = "v2.*", config = 'require("plugins.configs.toggleterm")' })

	use({ "andweeb/presence.nvim", event = "BufRead", config = 'require("plugins.configs.presence")' })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = 'require("plugins.configs.telescope")',
	})

	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- event = "BufRead",
		config = 'require("plugins.configs.treesitter")',
	})

	-- use 'echasnovski/mini.nvim'
	-- use({
	-- 	"nmac427/guess-indent.nvim",
	-- 	config = function()
	-- 		require("guess-indent").setup({})
	-- 	end,
	-- })

	-- use 'Darazaki/indent-o-matic'

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = "VimEnter",
	})

	-- using packer.nvim
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = "require('plugins.configs.bufferline')",
	})

	use({ "lukas-reineke/indent-blankline.nvim", config = 'require("plugins.configs.indent-blankline")' })

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		config = 'require("plugins.configs.cmp")',
	})

	use({
		"L3MON4D3/LuaSnip",
		config = 'require("plugins.configs.luasnip")',
	})

	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	use({ "octaltree/cmp-look", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
	use({ "f3fora/cmp-spell", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
	use({ "onsails/lspkind.nvim" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })

	use({ "rafamadriz/friendly-snippets" })

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		-- after = "InsertEnter",
	})

	-- use({
	-- 	"mhartington/formatter.nvim",
	-- 	config = function()
	-- 		require("plugins.configs.formatter")
	-- 	end,
	-- })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = 'require("plugins.configs.null-ls")',
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ "folke/lsp-colors.nvim" })

	-- use "glepnir/dashboard-nvim"
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup(require("plugins.configs.startup_nvim"))
		end,
	})

	use({
		"williamboman/mason.nvim",
		config = 'require("plugins.configs.mason")',
	})

	use("williamboman/mason-lspconfig.nvim")

	use("jayp0521/mason-nvim-dap.nvim")

	use("navarasu/onedark.nvim")

	use("matze/vim-move")

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "lervag/vimtex", config = 'require("plugins.configs.vimtex")' })

	use({ "rcarriga/nvim-notify" })

	use({
		"narutoxy/silicon.lua",
		requires = { "nvim-lua/plenary.nvim" },
		config = 'require("plugins.configs.silicon")',
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("dstein64/vim-startuptime")

	use({
		"lambdalisue/suda.vim",
	})

	use({ "fgheng/winbar.nvim", requires = "SmiteshP/nvim-navic", config = 'require("plugins.configs.winbar")' })

	-- use({ "sunjon/shade.nvim", event = "BufRead", config = 'require("plugins.configs.shade")' })

	-- use({
	-- 	"rktjmp/fwatch.nvim",
	-- 	config = 'require("plugins.configs.fwatch")',
	-- })

	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"Pocco81/DAPInstall.nvim",
		},
		config = 'require("plugins.configs.dap")',
	})

	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})

	use({
		"RRethy/vim-illuminate",
		config = 'require("plugins.configs.illuminate")',
	})

	use({
		"phaazon/hop.nvim",
		event = "BufRead",
		-- you can configure Hop the way you like here; see :h hop-config
		config = 'require("plugins.configs.hop")',
	})

	use({
		"Darazaki/indent-o-matic",
	})

	use({
		"Hoffs/omnisharp-extended-lsp.nvim",
	})
end)
]]
