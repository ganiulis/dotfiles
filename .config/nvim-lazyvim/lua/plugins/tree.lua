return {
	-- File explorer with LSP integration.
	-- See https://github.com/nvim-tree/nvim-tree.lua.
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		renderer = {
			group_empty = true,
		},
	},
	config = function(_, opts)
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<C-c>", ":NvimTreeCollapse<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
		-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
		-- 	callback = function()
		-- 		require("nvim-tree.api").tree.open()
		-- 	end,
		-- })
		require("nvim-tree").setup(opts)
	end,
}
