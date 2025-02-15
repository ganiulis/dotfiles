return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			go = { 'gofumpt', 'goimports-reviser' },
			css = { 'prettier' },
			scss = { 'prettier' },
			html = { 'prettier' },
			markdown = { 'prettier', 'markdownfmt' },
			terraform = { 'terraform_fmt' },
			typescript = { 'prettier' },
			-- yaml = { 'yamlfmt' }, breaks Helm chart rendering
			python = { 'isort', 'black' },
		},
		format_on_save = {
			timeout_ms = 1600,
			lsp_fallback = true,
		},
		linters_by_ft = {
			typescript = { 'eslint_d' },
		},
	},
}
