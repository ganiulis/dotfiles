return {
	'NvChad/NvChad',
	lazy = false,
	branch = 'v2.5',
	import = 'nvchad.plugins',
	config = function()
		require('nvchad.options')
		vim.o.cursorlineopt = 'both' -- See https://neovim.io/doc/user/options.html#'cursorlineopt'
	end,
}
