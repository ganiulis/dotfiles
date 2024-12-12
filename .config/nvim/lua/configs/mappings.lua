local set = vim.keymap.set

-- Uncategorized mappings

set('n', ';', ':', { desc = 'Enter command mode' })
set('i', 'jk', '<ESC>', { desc = 'Escape insert more' })

-- Version control

set('n', '<leader>gp', function() vim.api.nvim_exec2('!git push', {}) end, { desc = 'push changes', silent = true })
set('n', '<leader>gl', function() vim.api.nvim_exec2('!git pull', {}) end, { desc = 'pull changes', silent = true })
set('n', '<leader>gcn', function()
	for _, cmd in ipairs({ '!git add .', '!git commit -m "Add notes"', '!git push' }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = 'push note changes', silent = true })
set('n', '<leader>gcc', function()
	for _, cmd in ipairs({ '!git add .', '!git commit -m "Update configuration files"', '!git push' }) do
		vim.api.nvim_exec2(cmd, {})
	end
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
