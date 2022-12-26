-- Load the essentials
require('globals.globals')
require('globals.remaps')
require('globals.highlights')

-- Speed up nvim startup time
require('impatient')

-- Load Pywal colors
require('plugins.configs.pywal')
require('plugins.configs.luasnip')

-- Load the packer plugins
require('plugins')
