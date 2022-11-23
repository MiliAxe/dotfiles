-- vim.keymap.set('v', '<Leader>s',  function() silicon.visualise_api() end )

local silicon = require("silicon")
local pywal_core = require('pywal.core')
local colors = pywal_core.get_colors()

silicon.setup({
	bgColor = colors.color2,
})

vim.keymap.set('n', '<Leader>s', function() silicon.visualise_cmdline({ to_clip = true }) end)
vim.g.colors_name = 'pywal'

vim.notify = require("notify")

-- vim.api.nvim_create_augroup('SiliconRefresh', { clear = true })
-- vim.api.nvim_create_autocmd({ 'ColorScheme' },
-- 	{
-- 	group = 'SiliconRefresh',
-- 	callback = function()
-- 		silicon_utils.build_tmTheme()
-- 		silicon_utils.reload_silicon_cache({async = true})
-- 	end,
-- 	desc = 'Reload silicon themes cache on colorscheme switch',
-- 	}
-- )
