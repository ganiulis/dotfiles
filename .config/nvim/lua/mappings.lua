local set = vim.keymap.set

set('n', ';', ':', { desc = 'Enter command mode' })
set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })

-- Git

set('n', '<leader>gp', function() vim.api.nvim_exec2('!git push', {}) end, { desc = 'push changes' })
set('n', '<leader>gl', function() vim.api.nvim_exec2('!git pull', {}) end, { desc = 'pull changes' })

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
