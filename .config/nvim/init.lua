-- Lazy—package manager for Neovim
-- Mason—language server protocol manager

vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'
vim.g.mapleader = ' ' -- Leader key for actions—the space bar

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
	local repo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system({ 'git', 'clone', '--filter=blob:none', repo, '--branch=stable', lazypath })
end

local option = vim.opt
option.rtp:prepend(lazypath)
option.relativenumber = true -- Relative line numbers

require('lazy').setup({
	{
		'NvChad/NvChad',
		lazy = false,
		branch = 'v2.5',
		import = 'nvchad.plugins',
		config = function()
			require('nvchad.options')

			vim.o.cursorlineopt = 'both' -- See https://neovim.io/doc/user/options.html#'cursorlineopt'
		end,
	},
	{ import = 'plugins' },
}, require('configs.lazy'))

local base46_cache = vim.g.base46_cache
dofile(base46_cache .. 'defaults')
dofile(base46_cache .. 'statusline')

for _, file in ipairs({
	'nvchad.autocmds',
	'settings',
}) do
	require(file)
end

vim.schedule(function() require('mappings') end)
