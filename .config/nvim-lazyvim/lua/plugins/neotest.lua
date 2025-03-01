-- Runs unit tests for various languages.
-- See https://github.com/nvim-neotest/neotest.
-- This does not work right now.
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"fredrikaverpil/neotest-golang",
	},
	config = function()
		vim.keymap.set("n", "<leader>th", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Neo[t]est [h]ere" })
		vim.keymap.set("n", "<leader>tso", function()
			require("neotest").summary.open()
		end, { desc = "Neo[t]est [s]ummary [o]pen" })
		vim.keymap.set("n", "<leader>tsc", function()
			require("neotest").summary.close()
		end, { desc = "Neo[t]est [s]ummary [c]lose" })

		require("neotest").setup({
			adapters = {
				require("neotest-golang")({}),
			},
		})
	end,
}
