require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'pywal',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000, winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Feline statusline definition.
--
-- Note: This statusline does not define any colors. Instead the statusline is
-- built on custom highlight groups that I define. The colors for these
-- highlight groups are pulled from the current colorscheme applied. Check the
-- file: `lua/eden/modules/ui/colors.lua` to see how they are defined.

-- local pywal_core = require("pywal.core")
-- local colors = pywal_core.get_colors()
--
-- local line_ok, feline = pcall(require, "feline")
-- if not line_ok then
-- 	return
-- end
--
-- local one_monokai = {
-- 	fg = colors.foreground,
-- 	bg = colors.background,
-- 	green = "#98c379",
-- 	yellow = "#e5c07b",
-- 	purple = "#c678dd",
-- 	orange = "#d19a66",
-- 	peanut = "#f6d5a4",
-- 	red = "#e06c75",
-- 	aqua = "#61afef",
-- 	darkblue = colors.color1,
-- 	dark_red = "#f75f5f",
-- }
--
-- local vi_mode_colors = {
-- 	NORMAL = "green",
-- 	OP = "green",
-- 	INSERT = "yellow",
-- 	VISUAL = "purple",
-- 	LINES = "orange",
-- 	BLOCK = "dark_red",
-- 	REPLACE = "red",
-- 	COMMAND = "aqua",
-- }
--
-- local c = {
-- 	vim_mode = {
-- 		provider = {
-- 			name = "vi_mode",
-- 			opts = {
-- 				show_mode_name = true,
-- 				-- padding = "center", -- Uncomment for extra padding.
-- 			},
-- 		},
-- 		hl = function()
-- 			return {
-- 				fg = require("feline.providers.vi_mode").get_mode_color(),
-- 				bg = "darkblue",
-- 				style = "bold",
-- 				name = "NeovimModeHLColor",
-- 			}
-- 		end,
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	gitBranch = {
-- 		provider = "git_branch",
-- 		hl = {
-- 			fg = "peanut",
-- 			bg = "darkblue",
-- 			style = "bold",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	gitDiffAdded = {
-- 		provider = "git_diff_added",
-- 		hl = {
-- 			fg = "green",
-- 			bg = "darkblue",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	gitDiffRemoved = {
-- 		provider = "git_diff_removed",
-- 		hl = {
-- 			fg = "red",
-- 			bg = "darkblue",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	gitDiffChanged = {
-- 		provider = "git_diff_changed",
-- 		hl = {
-- 			fg = "fg",
-- 			bg = "darkblue",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "right_filled",
-- 	},
-- 	separator = {
-- 		provider = "",
-- 	},
-- 	fileinfo = {
-- 		provider = {
-- 			name = "file_info",
-- 			opts = {
-- 				type = "relative-short",
-- 			},
-- 		},
-- 		hl = {
-- 			style = "bold",
-- 		},
-- 		left_sep = " ",
-- 		right_sep = " ",
-- 	},
-- 	diagnostic_errors = {
-- 		provider = "diagnostic_errors",
-- 		hl = {
-- 			fg = "red",
-- 		},
-- 	},
-- 	diagnostic_warnings = {
-- 		provider = "diagnostic_warnings",
-- 		hl = {
-- 			fg = "yellow",
-- 		},
-- 	},
-- 	diagnostic_hints = {
-- 		provider = "diagnostic_hints",
-- 		hl = {
-- 			fg = "aqua",
-- 		},
-- 	},
-- 	diagnostic_info = {
-- 		provider = "diagnostic_info",
-- 	},
-- 	lsp_client_names = {
-- 		provider = "lsp_client_names",
-- 		hl = {
-- 			fg = "purple",
-- 			bg = "darkblue",
-- 			style = "bold",
-- 		},
-- 		left_sep = "left_filled",
-- 		right_sep = "block",
-- 	},
-- 	file_type = {
-- 		provider = {
-- 			name = "file_type",
-- 			opts = {
-- 				filetype_icon = true,
-- 				case = "titlecase",
-- 			},
-- 		},
-- 		hl = {
-- 			fg = "red",
-- 			bg = "darkblue",
-- 			style = "bold",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	file_encoding = {
-- 		provider = "file_encoding",
-- 		hl = {
-- 			fg = "orange",
-- 			bg = "darkblue",
-- 			style = "italic",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	position = {
-- 		provider = "position",
-- 		hl = {
-- 			fg = "green",
-- 			bg = "darkblue",
-- 			style = "bold",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	line_percentage = {
-- 		provider = "line_percentage",
-- 		hl = {
-- 			fg = "aqua",
-- 			bg = "darkblue",
-- 			style = "bold",
-- 		},
-- 		left_sep = "block",
-- 		right_sep = "block",
-- 	},
-- 	scroll_bar = {
-- 		provider = "scroll_bar",
-- 		hl = {
-- 			fg = "yellow",
-- 			style = "bold",
-- 		},
-- 	},
-- }
--
-- local left = {
-- 	c.vim_mode,
-- 	c.gitBranch,
-- 	c.gitDiffAdded,
--   c.gitDiffRemoved,
-- 	c.gitDiffChanged,
-- 	c.separator,
-- }
--
-- local middle = {
-- 	c.fileinfo,
-- 	c.diagnostic_errors,
-- 	c.diagnostic_warnings,
-- 	c.diagnostic_info,
-- 	c.diagnostic_hints,
-- }
--
-- local right = {
-- 	c.lsp_client_names,
-- 	c.file_type,
-- 	c.file_encoding,
-- 	c.position,
-- 	c.line_percentage,
-- 	c.scroll_bar,
-- }
--
-- local components = {
-- 	active = {
-- 		left,
-- 		middle,
-- 		right,
-- 	},
-- 	inactive = {
-- 		left,
-- 		middle,
-- 		right,
-- 	},
-- }
--
-- feline.setup({
-- 	components = components,
-- 	theme = one_monokai,
-- 	vi_mode_colors = vi_mode_colors,
-- })


-- require("lualine").setup {
-- 	options = {
-- 		theme = 'pywal',
-- 		component_separators = "|",
-- 		section_separators = { left = "", right = "" },
-- 	},
-- 	sections = {
-- 		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
-- 		lualine_b = { "filename", "branch", { "diff", colored = false } },
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = { "filetype", "progress" },
-- 		lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = { "filename" },
-- 		lualine_b = {},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	},
-- 	tabline = {},
-- }
-- --
