return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			markdown = { "prettier" },
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		require("conform").setup(opts)
	end,
}
