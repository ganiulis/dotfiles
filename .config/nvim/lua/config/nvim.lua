vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = function() require('nvim-tree.api').tree.open() end })
