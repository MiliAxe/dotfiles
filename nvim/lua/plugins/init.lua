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

local plugins = {
	-- { "kyazdani42/nvim-web-devicons" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = function ()
		require("plugins.configs.pywal")
	end, opts = ...},
	-- {"xiyaowong/transparent.nvim"},

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

	-- {
	-- 	"nimaaskarian/pywal16.nvim",
	-- 	name = "pywal",
	-- 	config = 'require("plugins.configs.pywal")'
	-- },
	-- {
	-- 	"MiliAxe/pywal16.nvim",
	-- 	-- event = "VimEnter",
	-- 	name = "pywal",
	-- 	config = 'require("plugins.configs.pywal")'
	-- },



	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		config = function()
			require("plugins.configs.indent-blankline")
		end,
	},


	-- Bottom statusbar
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
		event = "VeryLazy"
	},

	{
		"akinsho/toggleterm.nvim",
		-- version = "v2.*",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},

	{ "andweeb/presence.nvim", config = 'require("plugins.configs.presence")' },

	{ "nvim-lua/plenary.nvim" },

	{
		"nvim-telescope/telescope.nvim",
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

	{
		"nvim-treesitter/playground"
	},


	{
		"Darazaki/indent-o-matic",
		config = function ()
			require('indent-o-matic').setup{}
		end
	},

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
			-- { "hrsh7th/cmp-nvim-lsp-signature-help" },

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
		-- you can configure Hop the way you like here; see :h hop-config
		config = function()
			require("plugins.configs.hop")
		end,
	},

	-- {
	-- 	"Darazaki/indent-o-matic",
	-- },
	{
		'nmac427/guess-indent.nvim',
		config = function() require('guess-indent').setup {} end,
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

	-- {
	-- 	'Civitasv/cmake-tools.nvim',
	-- 	config = function()
	-- 		require("plugins.configs.cmake-tools")
	-- 	end,
	-- 	event = "BufReadPost",
	-- 	ft = {"cpp", "c"}
	-- },

	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.lsp_signature")
		end
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
		},
	},

	{
		"ivanesmantovich/xkbswitch.nvim",
		config = function ()
			require('xkbswitch').setup()
		end,
		ft = "tex",
	}
}

config = {
	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	defaults = {
		lazy = false,              -- should plugins be lazy-loaded?
		version = nil,
		-- default `cond` you can use to globally disable a lot of plugins
		-- when running inside vscode for example
		cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	-- leave nil when passing the spec as the first argument to setup()
	spec = nil, ---@type LazySpec
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	concurrency = jit.os:find("Windows") and (vim.loop.available_parallelism() * 2) or nil, ---@type number limit the maximum amount of concurrent tasks
	git = {
		-- defaults for the `Lazy log` command
		-- log = { "-10" }, -- show the last 10 commits
		log = { "-8" }, -- show commits from the last 3 days
		timeout = 120, -- kill processes that take more than 2 minutes
		url_format = "https://github.com/%s.git",
		-- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
		-- then set the below to false. This should work, but is NOT supported and will
		-- increase downloads a lot.
		filter = true,
	},
	dev = {
		-- directory where you store your local plugin projects
		path = "~/projects",
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {}, -- For example {"folke"}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { "habamax" },
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		wrap = true, -- wrap the lines in the ui
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "single",
		title = nil, ---@type string only works when border is not "none"
		title_pos = "center", ---@type "center" | "left" | "right"
		-- Show pills on top of the Lazy window
		pills = true, ---@type boolean
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
		-- leave nil, to automatically select a browser depending on your OS.
		-- If you want to use a specific browser, you can define it here
		browser = nil, ---@type string?
		throttle = 20, -- how frequently should the ui process render events
		custom_keys = {
			-- you can define custom key maps here.
			-- To disable one of the defaults, set it to false

			-- open lazygit log
			["<localleader>l"] = function(plugin)
				require("lazy.util").float_term({ "lazygit", "log" }, {
					cwd = plugin.dir,
				})
			end,

			-- open a terminal for the plugin dir
			["<localleader>t"] = function(plugin)
				require("lazy.util").float_term(nil, {
					cwd = plugin.dir,
				})
			end,
		},
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = "git",
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that dont have docs
		skip_if_doc_exists = true,
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
	build = {
		-- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
		-- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
		-- executed. In this case, a warning message will be shown.
		warn_on_override = true,
	},

}

require("lazy").setup(plugins, config)
