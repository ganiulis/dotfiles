return {
	'nvim-pack/nvim-spectre',
	dependencies = 'nvim-lua/plenary.nvim',
	opts = {
		replace_engine = { -- See https://github.com/nvim-pack/nvim-spectre/issues/249
			['sed'] = {
				cmd = 'sed',
				args = {
					'-i',
					'',
					'-E',
				},
			},
		},
	},
}
