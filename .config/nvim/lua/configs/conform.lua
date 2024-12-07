-- Formatters.
-- See https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters.
require('conform').setup({
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
	},
	format_on_save = {
		timeout_ms = 800,
		lsp_fallback = true,
	},
})
