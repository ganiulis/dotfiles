vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	callback = function() require('nvim-tree.api').tree.open() end,
})

vim.schedule(function() require('mappings') end)
