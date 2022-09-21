require("toggleterm").setup{
	direction = 'float',
	open_mapping = [[<c-t>]],
	float_opts = {
		border = 'curved',
	},
	winbar = {
		enabled = true,
		name_formatter = function(Terminal)
			return Terminal.name
		end
	},
}
