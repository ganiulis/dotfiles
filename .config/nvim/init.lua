-- See https://github.com/nvim-lua/kickstart.nvim/blob/4b31f8ef9e37f8a02739659a0a505927114c77af/init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'

for _, file in ipairs({ 'defaults', 'statusline' }) do
	dofile(vim.g.base46_cache .. file)
end

for _, file in ipairs({ 'configs.lazy', 'nvchad.autocmds', 'configs.settings' }) do
	require(file)
end
