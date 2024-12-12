local set = vim.keymap.set

set('n', ';', ':', { desc = 'Enter command mode' })
set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })

-- Version control

set('n', '<leader>gp', function() vim.api.nvim_exec2('!git push', {}) end, { desc = 'push changes', silent = true })
set('n', '<leader>gl', function() vim.api.nvim_exec2('!git pull', {}) end, { desc = 'pull changes', silent = true })
set('n', '<leader>gcn', function()
	local api = vim.api
	api.nvim_exec2('!git add .', {})
	api.nvim_exec2('!git commit -m "Add notes"', {})
	api.nvim_exec2('!git push', {})
end, { desc = 'push note changes', silent = true })
set('n', '<leader>gcc', function()
	local api = vim.api
	api.nvim_exec2('!git add .', {})
	api.nvim_exec2('!git commit -m "Update configuration files"', {})
	api.nvim_exec2('!git push', {})
end, { desc = 'push config changes', silent = true })

-- Spectre

set('n', '<C-s>', function() require('spectre').open_file_search() end, { desc = 'Search' })
set(
	'v',
	'<C-s>',
	function() require('spectre').open_file_search({ select_word = true }) end,
	{ desc = 'Search current selection' }
)
set(
	'n',
	'<C-a>',
	function() require('spectre').open_visual({ select_word = true }) end,
	{ desc = 'Search current word' }
)
