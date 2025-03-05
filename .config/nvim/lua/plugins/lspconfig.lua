return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	config = function()
		local lsp_config = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local on_attach = function(_, bufnr)
			local map = function(keys, func, desc)
				if desc then desc = "LSP: " .. desc end
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
			map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
			-- See `:help K` for why this keymap
			map("K", vim.lsp.buf.hover, "Hover Documentation")
			map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			map(
				"<leader>wl",
				function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
				"[W]orkspace [L]ist Folders"
			)

			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_) vim.lsp.buf.format() end, {
				desc = "Format current buffer with LSP",
			})
		end

		lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
			capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("lsp-file-operations").default_capabilities()
			),
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		mason_lspconfig.setup_handlers({
			function(server_name)
				lsp_config[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lsp_config.lua_ls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (
									vim.loop.fs_stat(path .. "/.luarc.json")
									or vim.loop.fs_stat(path .. "/.luarc.jsonc")
								)
							then
								return
							end
						end
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								version = "LuaJIT",
							},
							-- Make the server aware of Neovim runtime files.
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						})
					end,
					settings = {
						Lua = {},
					},
				})
			end,
		})
	end,
}
