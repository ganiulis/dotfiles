return {
	{
		'stevearc/conform.nvim',
		event = 'BufWritePre',
		config = function() require('configs.conform') end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('nvchad.configs.lspconfig').defaults()
			require('configs.lspconfig')
		end,
	},
	{
		'williamboman/mason.nvim',
		opts = {
			pkgs = {
				'lua-language-server',
				'markdownlint',
				'cssls',
				'yaml-language-server',
			},
			automatic_installation = true,
		},
	},
	{
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
	},
	{
		'ray-x/go.nvim', -- See https://github.com/ray-x/go.nvim.
		dependencies = {
			'ray-x/guihua.lua',
			'neovim/nvim-lspconfig',
			'nvim-treesitter/nvim-treesitter',
		},
		event = { 'CmdlineEnter' },
		ft = { 'go', 'gomod' },
		lazy = false,
	},
	{
		'jake-stewart/multicursor.nvim',
		branch = '1.0',
		config = function()
			local mc = require('multicursor-nvim')

			mc.setup()

			local set = vim.keymap.set

			-- Add or skip cursor above/below the main cursor.
			set({ 'n', 'v' }, '<A-k>', function() mc.lineAddCursor(-1) end)
			set({ 'n', 'v' }, '<A-K>', function() mc.lineSkipCursor(-1) end)
			set({ 'n', 'v' }, '<A-j>', function() mc.lineAddCursor(1) end)
			set({ 'n', 'v' }, '<A-J>', function() mc.lineSkipCursor(1) end)
			-- Rotate the main cursor.
			set({ 'n', 'v' }, '<A-l>', mc.nextCursor)
			-- Delete the main cursor.
			set({ 'n', 'v' }, '<A-x>', mc.clearCursors)
			-- Add and remove cursors with control + left click.
			set('n', '<A-leftmouse>', mc.handleMouse)

			-- Add or skip adding a new cursor by matching word/selection
			-- set({ 'n', 'v' }, '<leader>n', function() mc.matchAddCursor(1) end)
			-- set({ 'n', 'v' }, '<leader>s', function() mc.matchSkipCursor(1) end)
			-- set({ 'n', 'v' }, '<leader>N', function() mc.matchAddCursor(-1) end)
			-- set({ 'n', 'v' }, '<leader>S', function() mc.matchSkipCursor(-1) end)

			-- Add all matches in the document
			-- set({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors)

			-- You can also add cursors with any motion you prefer:
			-- set('n', '<right>', function() mc.addCursor('w') end)
			-- set('n', '<leader><right>', function() mc.skipCursor('w') end)

			-- set({ 'n', 'v' }, '<leader>H', mc.prevCursor)

			-- Easy way to add and remove cursors using the main cursor.
			-- set({ 'n', 'v' }, '<c-q>', mc.toggleCursor)

			-- Clone every cursor and disable the originals.
			-- set({ 'n', 'v' }, '<leader><c-q>', mc.duplicateCursors)

			-- Align cursor columns.
			-- set('n', '<leader>a', mc.alignCursors)

			-- Split visual selections by regex.
			-- set('v', 'S', mc.splitCursors)

			-- Append/insert for each line of visual selections.
			-- set('v', 'I', mc.insertVisual)
			-- set('v', 'A', mc.appendVisual)

			-- match new cursors within visual selections by regex.
			-- set('v', 'M', mc.matchCursors)

			-- Rotate visual selection contents.
			-- set('v', '<leader>t', function() mc.transposeCursors(1) end)
			-- set('v', '<leader>T', function() mc.transposeCursors(-1) end)

			-- Jumplist support
			-- set({ 'v', 'n' }, '<c-i>', mc.jumpForward)
			-- set({ 'v', 'n' }, '<c-o>', mc.jumpBackward)
		end,
		lazy = false,
	},
	{
		'lukas-reineke/headlines.nvim',
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},
	{
		'nvim-pack/nvim-spectre',
		dependencies = 'nvim-lua/plenary.nvim',
	},
}
