return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'
	-- the file picker (Nvim-tree)
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	--colorcode show
	-- use 'NvChad/nvim-colorizer.lua'

	use 'brenoprata10/nvim-highlight-colors'

	--lsp configurator
	use 'neovim/nvim-lspconfig'

	use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }

	-- use {
	-- 	"oncomouse/lushwal",
	-- 	requires = { { "rktjmp/lush.nvim", opt = true }, { "rktjmp/shipwright.nvim", opt = true } },
	-- }

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- use {
	--   'romgrk/barbar.nvim',
	--   requires = {'kyazdani42/nvim-web-devicons'}
	-- }

	use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
		require("toggleterm").setup()
	end }

	use 'andweeb/presence.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use { "nvim-telescope/telescope-file-browser.nvim" }
	use { "nvim-telescope/telescope-media-files.nvim" }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- use 'echasnovski/mini.nvim'
	use {
		'nmac427/guess-indent.nvim',
		config = function() require('guess-indent').setup {} end,
	}

	-- use 'Darazaki/indent-o-matic'

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
		event = "VimEnter",
	}

	-- using packer.nvim
	use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

	use "lukas-reineke/indent-blankline.nvim"

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})

	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		requires = {
			'L3MON4D3/LuaSnip',
		},
		config = function()
			require "plugins.configs.cmp"
		end,
	}

	use { "hrsh7th/cmp-path", after = "nvim-cmp" }
	use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
	use { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" }
	use { 'octaltree/cmp-look', after = "nvim-cmp" }
	use { 'hrsh7th/cmp-calc', after = "nvim-cmp" }
	use { 'f3fora/cmp-spell', after = "nvim-cmp" }
	use { 'hrsh7th/cmp-emoji', after = "nvim-cmp" }
	use { 'onsails/lspkind.nvim' }
	use { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" }

	use { "rafamadriz/friendly-snippets",
		event = "InsertCharPre" }

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end,
		-- after = "InsertEnter",
	}

	use { 'mhartington/formatter.nvim',
		config = function()
			require('plugins.configs.formatter')
		end }

	-- use({
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	config = function()
	-- 		require("null-ls").setup()
	-- 	end,
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- })


	use { 'folke/lsp-colors.nvim' }

	-- use "glepnir/dashboard-nvim"
	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require "startup".setup(require "plugins.configs.startup_nvim")
		end
	}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	use 'navarasu/onedark.nvim'

	use 'matze/vim-move'

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use 'feline-nvim/feline.nvim'

	use {
		'lewis6991/gitsigns.nvim',
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	}
	use { 'lervag/vimtex' }

	-- Packer
	-- use({
	-- 	"folke/noice.nvim",
	-- 	config = function()
	-- 		require("noice").setup()
	-- 	end,
	-- 	requires = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	-- event = "VimEnter"
	-- })
	--
	use { "rcarriga/nvim-notify",
	}

	use {
		"narutoxy/silicon.lua",
		requires = { "nvim-lua/plenary.nvim" },
		-- config = function()
		-- 	-- require('silicon').setup({
		-- 	-- 	bgColor = "#fff",
		-- 	-- })
		-- end
	}

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use 'dstein64/vim-startuptime'

	use {
		'glacambre/firenvim',
		run = function() vim.fn['firenvim#install'](0) end
	}

	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	use {
		"lambdalisue/suda.vim"
	}
end)
