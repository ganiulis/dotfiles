return {
	'williamboman/mason-lspconfig.nvim',
	event = 'BufWritePre',
	lazy = false, -- Need to check if possible to lazy-load this config
	config = function()
		local lspconfig = require('lspconfig')
		require('mason').setup()
		local nvchad_lspconfig = require('nvchad.configs.lspconfig')

		nvchad_lspconfig.defaults()

		require('mason-lspconfig').setup({
			ensure_installed = {
				'bashls',
				'lua_ls',
				'marksman',
				'pyright',
				'rust_analyzer',
				'ts_ls',
			},
			require('mason-lspconfig').setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = nvchad_lspconfig.on_attach,
						on_init = nvchad_lspconfig.on_init,
						capabilities = nvchad_lspconfig.capabilities,
					})
				end,
				['gopls'] = function()
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
								staticcheck = true,
								vulncheck = 'Imports',
								gofumpt = true,
							},
						},
					})
				end,
			}),
		})

		print('mason-lspconfig.nvim loaded')
	end,
}
