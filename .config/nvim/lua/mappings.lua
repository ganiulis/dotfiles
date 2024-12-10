local set = vim.keymap.set

set('n', ';', ':', { desc = 'Enter command mode' })
set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })
set('n', '<leader>gp', function()
	local api = vim.api
	api.nvim_exec2('!git push', {})
end, {
	desc = 'git push',
	silent = true,
})
set('n', '<leader>gl', function()
	local api = vim.api
	api.nvim_exec2('!git pull', {})
end, {
	desc = 'git pull',
	silent = true,
})
