vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'
vim.g.mapleader = ' '
local base46_cache = vim.g.base46_cache
dofile(base46_cache .. 'defaults')
dofile(base46_cache .. 'statusline')
