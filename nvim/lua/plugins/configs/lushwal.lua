vim.g.lushwal_configuration = {
compile_to_vimscript = true,
color_overrides = nil,
addons = {
	ale = false,
	barbar = false,
	bufferline_nvim = false,
	coc_nvim = false,
	dashboard_nvim = false,
	fern_vim = false,
	gina = false,
	gitsigns_nvim = false,
	hop_nvim = false,
	hydra_nvim = false,
	indent_blankline_nvim = true,
	lightspeed_nvim = false,
	lspsaga_nvim = false,
	lsp_trouble_nvim = false,
	lualine = true,
	markdown = false,
	mini_nvim = true,
	native_lsp = true,
	neogit = false,
	neomake = false,
	nerdtree = false,
	nvim_cmp = false,
	nvim_tree_lua = true,
	nvim_ts_rainbow = false,
	semshi = false,
	telescope_nvim = true,
	treesitter = true,
	vim_dirvish = false,
	vim_gitgutter = false,
	vim_signify = false,
	vim_sneak = false,
	which_key_nvim = false,
	}
}

vim.cmd[[set termguicolors]]
vim.cmd[[colorscheme lushwal]]
vim.cmd[[LushwalCompile]]
--
-- require('onedark').setup {
    -- style = 'darker'
-- }
-- require('onedark').load()

-- local pywal = require('pywal')
--
-- pywal.setup()