local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd

return {
	["n|<C-t>"] = map_cr("ToggleTerm direction=float"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["i|<C-t>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<C-t>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
}
