return {
	{
		"williamboman/mason.nvim",
		---@param opts MasonSettings
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		---@param opts MasonLspconfigSettings
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			-- Don't forget to run MasonToolsClean from time to time to remove unlisted packages.
			ensure_installed = {
				"lua-language-server",
				"marksman",
				"prettier",
				"shellcheck",
				"stylua",
			},
			auto_update = true,
		},
		config = function(_, opts)
			require("mason-tool-installer").setup(opts)
		end,
	},
}
