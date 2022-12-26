-- Make packer's window floating
require("packer").init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Automatically run :PackerSync when update plugins list
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- Plugins List
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
		config = 'require("plugins.configs.telescope")'
	})

	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- event = "BufRead",
		config = 'require("plugins.configs.treesitter")'
	})

	-- use 'echasnovski/mini.nvim'
	use({
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	})

	-- use 'Darazaki/indent-o-matic'

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = "VimEnter",
	})

	-- using packer.nvim
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons",
		config = "require('plugins.configs.bufferline')" })

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

	use {
		'L3MON4D3/LuaSnip',
		config = 'require("plugins.configs.luasnip")'
	}

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

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.configs.formatter")
		end,
	})

	-- use({
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	config = function()
	-- 		require("null-ls").setup()
	-- 	end,
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- })

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
		config = 'require("plugins.configs.silicon")'
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

	use({ "sunjon/shade.nvim", event = "BufRead", config = 'require("plugins.configs.shade")' })

	use({
		"rktjmp/fwatch.nvim",
		config = 'require("plugins.configs.fwatch")',
	})

	use({
		"mfussenegger/nvim-dap",

		requires = {
			"rcarriga/nvim-dap-ui",
			"Pocco81/DAPInstall.nvim"
		},

		config = 'require("plugins.configs.dap")'
	})

end)
