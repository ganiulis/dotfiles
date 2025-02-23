return {
	{
		"williamboman/mason.nvim",
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"marksman",
				"prettier",
				"shellcheck",
				"stylua",
			},
		},
	},
}
