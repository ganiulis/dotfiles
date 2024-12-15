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
			typescript = { 'prettier' },
			yaml = { 'yamlfmt' },
			python = { 'prettier' },
		},
		format_on_save = {
			timeout_ms = 800,
			lsp_fallback = true,
		},
	},
}
