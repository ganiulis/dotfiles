vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "<leader>gpn", function()
	for _, cmd in ipairs({ "!git add .", '!git commit -m "Add notes"', "!git push" }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = "[Custom] [g]it [p]ush [n]otes" })
vim.keymap.set("n", "<leader>gpc", function()
	for _, cmd in ipairs({ "!git add .", '!git commit -m "Update configuration"', "!git push" }) do
		vim.api.nvim_exec2(cmd, {})
	end
end, { desc = "[Custom] [g]it [p]ush [c]onfig" })
