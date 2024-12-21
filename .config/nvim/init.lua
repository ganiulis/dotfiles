vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46/'
require('config.lazy')
require('config.NvChad')
require('config.nvim')
vim.schedule(function() require('config.mapping') end)
