return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local on_attach = function(_, bufnr)
			local map = function(keys, func, desc)
				if desc then desc = 'LSP: ' .. desc end
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
			map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
			map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
			map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
			map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
			map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
			map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
			-- See `:help K` for why this keymap
			map('K', vim.lsp.buf.hover, 'Hover Documentation')
			map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
			-- Lesser used LSP functionality
			map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
			map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
			map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
			map(
				'<leader>wl',
				function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
				'[W]orkspace [L]ist Folders'
			)

			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_) vim.lsp.buf.format() end, {
				desc = 'Format current buffer with LSP',
			})
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		require('mason-lspconfig').setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			['gopls'] = function()
				lspconfig.gopls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							staticcheck = true,
							vulncheck = 'Imports',
							gofumpt = true,
						},
					},
				})
			end,
		})
	end,
}
