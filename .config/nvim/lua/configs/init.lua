vim.g.base46_cache = vim.fn.stdpath('data') .. '/nvchad/base46/'
vim.g.mapleader = ' '

for _, file in ipairs({ 'defaults', 'statusline' }) do
	dofile(vim.g.base46_cache .. file)
end
