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

require('lazy').setup({ import = 'plugins' }, require('configs.lazy')) -- lazy.nvim is a package manager for Neovim

local base46_cache = vim.g.base46_cache
dofile(base46_cache .. 'defaults')
dofile(base46_cache .. 'statusline')

for _, file in ipairs({
	'nvchad.autocmds',
	'settings',
}) do
	require(file)
end
