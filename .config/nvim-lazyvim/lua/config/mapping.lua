vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "<leader>gcn", function()
	for _, cmd in ipairs({ "!git add .", '!git commit -m "Add notes"', "!git push" }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = "quick push notes" })
vim.keymap.set("n", "<leader>gcc", function()
	for _, cmd in ipairs({ "!git add .", '!git commit -m "Update configuration files"', "!git push" }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = "quick push config" })
