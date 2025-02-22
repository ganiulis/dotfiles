return {
	'folke/trouble.nvim',
	opts = {
		auto_close = true, -- auto close when there are no items
		auto_open = true, -- auto open when there are items
	}, -- TODO: This plugin is extensive and I should check what I can use to make my life easier
	cmd = 'Trouble',
	keys = {
		{
			'<leader>dx',
			'<cmd>Trouble diagnostics toggle<cr>',
			desc = 'Diagnostics (Trouble)',
		},
		{
			'<leader>dX',
			'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
			desc = 'Buffer Diagnostics (Trouble)',
		},
		{
			'<leader>cs',
			'<cmd>Trouble symbols toggle focus=false<cr>',
			desc = 'Symbols (Trouble)',
		},
		{
			'<leader>cl',
			'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
			desc = 'LSP Definitions / references / ... (Trouble)',
		},
		{
			'<leader>dL',
			'<cmd>Trouble loclist toggle<cr>',
			desc = 'Location List (Trouble)',
		},
		{
			'<leader>dQ',
			'<cmd>Trouble qflist toggle<cr>',
			desc = 'Quickfix List (Trouble)',
		},
	},
}
