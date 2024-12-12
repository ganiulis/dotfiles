return {
	'williamboman/mason.nvim', -- mason.nvim is a language server protocol manager
	opts = {
		pkgs = {
			'lua-language-server',
			'markdownlint',
			'cssls',
			'yaml-language-server',
		},
		automatic_installation = true,
	},
}
