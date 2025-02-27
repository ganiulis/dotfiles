vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46/'
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
require('config.lazy')
require('config.NvChad')
require('config.nvim')
vim.schedule(function() require('config.mapping') end)
