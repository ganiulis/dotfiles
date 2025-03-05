return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function() require("which-key").show({ global = false }) end,
			desc = "(WhichKey) Show key mappings",
		},
	},
}
