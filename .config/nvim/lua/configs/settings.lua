vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = function() require('nvim-tree.api').tree.open() end })
vim.schedule(function()
	for _, file in ipairs({ 'nvchad.mappings', 'configs.mappings' }) do
		require(file)
	end
end)
