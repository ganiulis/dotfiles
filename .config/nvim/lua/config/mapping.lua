-- Mappings

vim.keymap.set('n', ';', ':', { desc = 'Enter command mode' })
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })

-- Version control

vim.keymap.set('n', 'gp', function() vim.api.nvim_exec2('!git push', {}) end, { desc = 'push changes' })
vim.keymap.set('n', 'gl', function() vim.api.nvim_exec2('!git pull', {}) end, { desc = 'pull changes' })
vim.keymap.set('n', '<leader>gcn', function()
	for _, cmd in ipairs({ '!git add .', '!git commit -m "Add notes"', '!git push' }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = 'push note changes' })
vim.keymap.set('n', '<leader>gcc', function()
	for _, cmd in ipairs({ '!git add .', '!git commit -m "Update configuration files"', '!git push' }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = 'push config changes' })

-- Spectre

vim.keymap.set('n', '<C-s>', function() require('spectre').open_file_search() end, { desc = 'Search' })
vim.keymap.set(
	'v',
	'<C-s>',
	function() require('spectre').open_file_search({ select_word = true }) end,
	{ desc = 'Search current selection' }
)
vim.keymap.set(
	'n',
	'<C-a>',
	function() require('spectre').open_visual({ select_word = true }) end,
	{ desc = 'Search current word' }
)
