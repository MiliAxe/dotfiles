local custom = {}

custom["ellisonleao/gruvbox.nvim"] = {
	lazy = false,
	name = "gruvbox",
	config = require("configs.ui.gruvbox"),
}

custom["f-person/auto-dark-mode.nvim"] = {
	opts = {},
}

return custom
