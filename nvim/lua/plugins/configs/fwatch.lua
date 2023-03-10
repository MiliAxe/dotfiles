local fwatch = require("fwatch")
local defer = nil
local silicon_utils = require("silicon.utils")

-- fwatch.watch("/home/mili/.cache/wal/colors", "colorscheme pywal")
fwatch.watch("/home/mili/.cache/wal/colors", {
	on_event = function()
		if not defer then
			defer = vim.defer_fn(function()
				defer = nil
				vim.cmd("colorscheme pywal")
				silicon_utils.build_tmTheme()
				silicon_utils.reload_silicon_cache({ async = true })
			end, 100)
		end
	end,
})
