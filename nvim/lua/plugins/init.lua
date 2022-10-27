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

	use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }

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

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'echasnovski/mini.nvim'
	use {
		'nmac427/guess-indent.nvim',
		config = function() require('guess-indent').setup {} end,
	}

	-- use 'Darazaki/indent-o-matic'

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
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
		requires = {
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
			'f3fora/cmp-spell', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip',
			'onsails/lspkind.nvim',
		}
	}

	use "rafamadriz/friendly-snippets"

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use { 'mhartington/formatter.nvim' }

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
	use 'lervag/vimtex'


end)
