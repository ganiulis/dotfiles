-- See https://github.com/nvim-lua/kickstart.nvim/blob/4b31f8ef9e37f8a02739659a0a505927114c77af/init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'

for _, file in ipairs({ 'defaults', 'statusline' }) do
	dofile(vim.g.base46_cache .. file)
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ import = 'plugins' }, {
	defaults = { lazy = true },
	install = { colorscheme = { 'nvchad' } },
	ui = {
		icons = {
			ft = '',
			lazy = '󰂠 ',
			loaded = '',
			not_loaded = '',
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				'2html_plugin',
				'tohtml',
				'getscript',
				'getscriptPlugin',
				'gzip',
				'logipat',
				'netrw',
				'netrwPlugin',
				'netrwSettings',
				'netrwFileHandlers',
				'matchit',
				'tar',
				'tarPlugin',
				'rrhelper',
				'spellfile_plugin',
				'vimball',
				'vimballPlugin',
				'zip',
				'zipPlugin',
				'tutor',
				'rplugin',
				'syntax',
				'synmenu',
				'optwin',
				'compiler',
				'bugreport',
				'ftplugin',
			},
		},
	},
})

require('nvchad.autocmds')

vim.o.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = function() require('nvim-tree.api').tree.open() end })
vim.schedule(function() require('nvchad.mappings') end)

-- Mappings

vim.keymap.set('n', ';', ':', { desc = 'Enter command mode' })
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })

-- Version control

vim.keymap.set('n', 'gp', function() vim.api.nvim_exec2('!git push', {}) end, { desc = 'push changes' })
vim.keymap.set('n', 'gl', function() vim.api.nvim_exec2('!git pull', {}) end, { desc = 'pull changes' })
vim.keymap.set('n', '<leader>gcn', function()
	for _, cmd in ipairs({ '!git add .', '!git commit -m "Add notes"', '!git push' }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = 'push note changes' })
vim.keymap.set('n', '<leader>gcc', function()
	for _, cmd in ipairs({ '!git add .', '!git commit -m "Update configuration files"', '!git push' }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = 'push config changes' })

-- Spectre

vim.keymap.set('n', '<C-s>', function() require('spectre').open_file_search() end, { desc = 'Search' })
vim.keymap.set(
	'v',
	'<C-s>',
	function() require('spectre').open_file_search({ select_word = true }) end,
	{ desc = 'Search current selection' }
)
vim.keymap.set(
	'n',
	'<C-a>',
	function() require('spectre').open_visual({ select_word = true }) end,
	{ desc = 'Search current word' }
)
