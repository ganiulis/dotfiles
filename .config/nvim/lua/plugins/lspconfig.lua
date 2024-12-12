return {
	'neovim/nvim-lspconfig',
	config = function()
		require('nvchad.configs.lspconfig').defaults()
		local lspconfig = require('lspconfig')
		local nvchad_lspconfig = require('nvchad.configs.lspconfig')

		for _, lsp in ipairs({
			'marksman', -- Markdown LS
			'bashls', -- Bash LS
			'rust_analyzer', -- Rust LS
			'ts_ls', -- TypeScript LS
			'lua_ls', -- Lua LS
		}) do
			lspconfig[lsp].setup({
				on_attach = nvchad_lspconfig.on_attach,
				on_init = nvchad_lspconfig.on_init,
				capabilities = nvchad_lspconfig.capabilities,
			})
		end

		lspconfig.gopls.setup({
			on_attach = nvchad_lspconfig.on_attach,
			on_init = nvchad_lspconfig.on_init,
			capabilities = nvchad_lspconfig.capabilities,
			settings = {
				gopls = {
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						fieldalignment = true,
						shadow = true,
						unusedvariable = true,
						useany = true,
					},
					staticcheck = true,
					vulncheck = 'Imports',
					gofumpt = true,
				},
			},
		})
	end,
}