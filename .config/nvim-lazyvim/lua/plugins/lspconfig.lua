return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lspconfig").marksman.setup({})
	end,
}
