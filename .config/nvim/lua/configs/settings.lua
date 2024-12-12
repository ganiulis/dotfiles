vim.opt.relativenumber = true -- Relative line numbers
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = function() require('nvim-tree.api').tree.open() end })
vim.schedule(function()
	require('nvchad.mappings')
	require('configs.mappings')
end)
