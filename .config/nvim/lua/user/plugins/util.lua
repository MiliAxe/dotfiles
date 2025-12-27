local custom = {}

-- custom["m4xshen/hardtime.nvim"] = {
--    event = "BufReadPre",
--    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
--    opts = {}
-- }

custom["kylechui/nvim-surround"] = {
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	opts = {},
}

custom["mcookly/bidi.nvim"] = {
	event = "VeryLazy",
	opts = {},
}

custom["max397574/better-escape.nvim"] = {
	event = "VeryLazy",
	opts = {},
}

custom["julienvincent/hunk.nvim"] = {
	cmd = { "DiffEditor" },
	config = function()
		require("hunk").setup()
	end,
	dependencies = { "MunifTanjim/nui.nvim" },
}

custom["chentoast/marks.nvim"] = {
	event = "VeryLazy",
	opts = {},
}

custom["vyfor/cord.nvim"] = {
	build = "./build || .\\build",
	event = "VeryLazy",
	opts = {}, -- calls require('cord').setup()
}

custom["HakonHarnes/img-clip.nvim"] = {
	event = "VeryLazy",
	opts = {
		-- add options here
		-- or leave it empty to use the default settings
	},
	keys = {
		-- suggested keymap
		{ "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}

custom["CopilotC-Nvim/CopilotChat.nvim"] = {
	dependencies = {
		-- { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		-- See Configuration section for options
	},
	-- See Commands section for default commands if you want to lazy load on them
}

custom["yetone/avante.nvim"] = {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = true,
	version = false, -- set this if you want to always pull the latest change
	opts = {
		provider = "copilot",
		-- behaviour = {
		-- 	auto_focus_sidebar = false,
		-- },
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

-- custom["phrmendes/todotxt.nvim"] = {
-- 	-- cmd = { "TodoTxt", "DoneTxt" },
-- 	opts = {
-- 		todotxt = "/home/mili/Documents/Todo.txt",
-- 		donetxt = "/home/mili/Documents/Done.txt",
-- 		ghost_text = {
-- 			enable = true,
-- 			mappings = {
-- 				["(A)"] = "now",
-- 				["(B)"] = "next",
-- 				["(C)"] = "today",
-- 			},
-- 		},
-- 	},
-- }

custom["vim-scripts/todo-txt.vim"] = {
	event = {
		"BufNewFile \\(todo\\|done\\)*.txt",
		"BufReadPre \\(todo\\|done\\)*.txt",
		"BufReadPre *.\\(todo\\|done\\)*.txt",
		"BufNewFile *.\\(todo\\|done\\)*.txt",
	},
}

return custom
