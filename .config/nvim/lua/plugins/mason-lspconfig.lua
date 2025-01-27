return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		'williamboman/mason.nvim',
	},
	opts = {
		automatic_installation = true,
		ensure_installed = {
			'bashls',
			'lua_ls',
			'marksman',
			'pyright',
			'terraformls',
			'ts_ls',
		},
	},
}
