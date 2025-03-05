return {
	{
		-- LSP binary manager.
		"williamboman/mason.nvim",
		---@param opts MasonSettings
		config = function(_, opts) require("mason").setup(opts) end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		---@param opts MasonLspconfigSettings
		config = function(_, opts) require("mason-lspconfig").setup(opts) end,
	},
	{
		-- Installs LSPs automatically.
		-- Depends on mason.nvim
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			-- Don't forget to run MasonToolsClean from time to time to remove unlisted packages.
			ensure_installed = {
				-- "gopls", add it back once neotest is figured out.
				"lua-language-server",
				"marksman",
				"prettier",
				"shellcheck",
				"stylua",
			},
			auto_update = true,
		},
		config = function(_, opts) require("mason-tool-installer").setup(opts) end,
	},
}
