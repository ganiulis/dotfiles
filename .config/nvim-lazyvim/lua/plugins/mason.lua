return {
	-- LSP package manager.
	-- See https://github.com/williamboman/mason.nvim.
	"williamboman/mason.nvim",
	opts = {
		automatic_installation = true,
		ensure_installed = {
			"prettier",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
	end,
}
