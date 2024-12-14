return {
	'ray-x/go.nvim',
	event = { 'CmdlineEnter' },
	dependencies = {
		'ray-x/guihua.lua',
		'neovim/nvim-lspconfig',
		'nvim-treesitter/nvim-treesitter',
	},
	ft = { 'go', 'gomod' },
	build = ':lua require("go.install").update_all_sync()',
}
