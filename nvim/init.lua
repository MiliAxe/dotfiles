require('globals.globals')
require('globals.remaps')

-- Load plugin configs
require('plugins.configs.lushwal')
require('plugins.configs.lualine')
require('plugins.configs.bufferline')
-- require('plugins.configs.cmp')
-- require('plugins.configs.coderunner')
require('plugins.configs.colorizer')
-- require('plugins.configs.comment')
require('plugins.configs.guess-indent')
require('plugins.configs.indent-blankline')
require('plugins.configs.lspconfig')
require('plugins.configs.luasnip')
-- require('plugins.configs.mini')
require('plugins.configs.null-ls')
require('plugins.configs.nvim-tree')
require('plugins.configs.presence')
require('plugins.configs.toggleterm')
require('plugins.configs.treesitter')
require('plugins.configs.telescope')
require('plugins.configs.mason')
-- require('plugins.configs.feline')
require('plugins.configs.vimtex')
require('plugins.configs.silicon')

-- Load the packer plugins
require('plugins')
