return {
	-- Not sure if this works.
	"antosha417/nvim-lsp-file-operations",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Uncomment whichever supported plugin(s) you use
		"nvim-tree/nvim-tree.lua",
		-- "nvim-neo-tree/neo-tree.nvim",
		-- "simonmclean/triptych.nvim"
	},
	opts = {
		-- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
		debug = false,
		-- select which file operations to enable
		operations = {
			willRenameFiles = true,
			didRenameFiles = true,
			willCreateFiles = true,
			didCreateFiles = true,
			willDeleteFiles = true,
			didDeleteFiles = true,
		},
		-- how long to wait (in milliseconds) for file rename information before cancelling
		timeout_ms = 10000,
	},
	config = function(_, opts) require("lsp-file-operations").setup(opts) end,
}
