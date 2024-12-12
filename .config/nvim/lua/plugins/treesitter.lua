return {
	'nvim-treesitter/nvim-treesitter', -- Better syntax highlighting. See https://github.com/nvim-treesitter/nvim-treesitter
	opts = {
		ensure_installed = {
			'vim',
			'lua',
			'vimdoc',
			'html',
			'rust',
			'go',
			'yaml',
			'typescript',
			'javascript',
		},
	},
}
