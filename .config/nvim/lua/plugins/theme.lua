return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		vim.cmd("colorscheme tokyonight")
		require("tokyonight").setup(opts)
	end,
}
