return {
	'ray-x/go.nvim',
	-- event = { 'CmdlineEnter' },
	-- dependencies = {
	-- 	'ray-x/guihua.lua',
	-- 	'neovim/nvim-lspconfig',
	-- 	'nvim-treesitter/nvim-treesitter',
	-- },
	ft = { 'go', 'gomod' },
	opts = {
		-- goimports = 'gopls', -- if set to 'gopls' will use golsp format
		-- gofmt = 'gopls', -- if set to gopls will use golsp format
		-- tag_transform = false,
		-- test_dir = '',
		-- comment_placeholder = '   ',
		-- lsp_cfg = true, -- false: use your own lspconfig
		-- lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
		-- lsp_on_attach = true, -- use on_attach from go.nvim
		-- dap_debug = true,
	},
	config = function(_, opts)
		require('go').setup(opts)
		print('go.nvim loaded.')
	end,
}
