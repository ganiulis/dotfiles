-- See https://github.com/nvim-lua/kickstart.nvim/blob/4b31f8ef9e37f8a02739659a0a505927114c77af/init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = function() require('nvim-tree.api').tree.open() end })

vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'
dofile(vim.g.base46_cache .. 'defaults')
dofile(vim.g.base46_cache .. 'statusline')

require('config.lazy')
require('nvchad.autocmds')
require('config.mapping')
