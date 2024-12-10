local set = vim.keymap.set

set('n', ';', ':', { desc = 'Enter command mode' })
set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })

-- Version control

set('n', '<leader>gp', function() vim.api.nvim_exec2('!git push', {}) end, { desc = 'push changes', silent = true })
set('n', '<leader>gl', function() vim.api.nvim_exec2('!git pull', {}) end, { desc = 'pull changes', silent = true })
set(
	'n',
	'<leader>gcn',
	function() vim.api.nvim_exec2('!git commit -am "Add notes"', {}) end,
	{ desc = 'commit notes', silent = true }
)
set(
	'n',
	'<leader>gcc',
	function() vim.api.nvim_exec2('!git commit -am "Update configuration files"', {}) end,
	{ desc = 'commit config', silent = true }
)

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
