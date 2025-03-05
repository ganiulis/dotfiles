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
		vim.keymap.set(
			"n",
			"<C-n>",
			":NvimTreeToggle<CR>",
			{ noremap = true, silent = true, desc = "(NvimTree) Toggle file explorer" }
		)
		vim.keymap.set(
			"n",
			"<C-c>",
			":NvimTreeCollapse<CR>",
			{ noremap = true, silent = true, desc = "(NvimTree) Collapse file explorer" }
		)
		vim.keymap.set(
			"n",
			"<leader>e",
			":NvimTreeFocus<CR>",
			{ noremap = true, silent = true, desc = "(NvimTeee) Focus on the file explorer" }
		)
		vim.keymap.set(
			"n",
			"<leader>fe",
			":NvimTreeFindFile<CR>",
			{ noremap = true, silent = true, desc = "(NvimTree) Find the current file in the file explorer" }
		)
		require("nvim-tree").setup(opts)
	end,
}
