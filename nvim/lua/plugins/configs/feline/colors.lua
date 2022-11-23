-- ~/.config/nvim/lua/plugins/feline/colors.lua
-- One-dark colors

local pywal_core = require('pywal.core')
local colors = pywal_core.get_colors()

local _M = {
    bg = colors.background,
    fg = colors.foreground,
    -- yellow = '#e5c07b',
    yellow = "#e0af68",
    -- cyan = '#8abeb7',
    cyan = '#56b6c2',
    -- darkblue = '#528bff',
    darkblue = '#61afef',
    -- green = '#98c379',
    green = colors.color3,
    -- orange = '#d19a66',
    orange = '#d19a66',
    -- violet = '#b294bb',
    violet = '#c678dd',
    -- magenta = '#ff80ff',
    -- magenta = '#c678dd',
    magenta = '#FFFFFF',
    -- blue = '#61afef';
    blue = colors.foreground,
    -- red = '#e88388'
    red = '#e86671'
}


return _M
