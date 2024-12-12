for _, file in ipairs({ 'configs.init', 'configs.lazy', 'nvchad.autocmds', 'configs.settings' }) do
	require(file)
end
