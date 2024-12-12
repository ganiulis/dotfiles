vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'
vim.g.mapleader = ' '
dofile(vim.g.base46_cache .. 'defaults')
dofile(vim.g.base46_cache .. 'statusline')
