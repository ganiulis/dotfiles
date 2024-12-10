local data = vim.fn.stdpath('data')

vim.g.base46_cache = data .. '/nvchad/base46/'
vim.g.mapleader = ' '

local lazypath = data .. '/lazy/lazy.nvim'
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

require('lazy').setup({ import = 'plugins' }, require('configs.lazy'))

local base46_cache = vim.g.base46_cache
dofile(base46_cache .. 'defaults')
dofile(base46_cache .. 'statusline')

for _, file in ipairs({ 'nvchad.autocmds', 'settings' }) do
	require(file)
end
