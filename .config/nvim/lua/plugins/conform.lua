return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			go = { 'gofumpt' },
			css = { 'prettier' },
			scss = { 'prettier' },
			html = { 'prettier' },
			markdown = { 'prettier', 'markdownfmt' },
			rust = { 'rustfmt' },
			terraform = { 'terraform_fmt' },
			typescript = { 'prettier' },
			yaml = { 'yamlfmt' },
			python = { 'isort', 'black' },
		},
		format_on_save = {
			timeout_ms = 1600,
			lsp_fallback = true,
		},
	},
}
