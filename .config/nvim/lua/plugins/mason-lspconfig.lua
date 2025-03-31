return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "ray-x/lsp_signature.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_signature = require("lsp_signature")
    local telescope_builtin = require("telescope.builtin")
    -- lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
    -- 	capabilities = vim.tbl_deep_extend(
    -- 		"force",
    -- 		vim.lsp.protocol.make_client_capabilities(),
    -- 		require("lsp-file-operations").default_capabilities()
    -- 	),
    -- })
    local on_attach = function(client, bufnr)
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true) end
      lsp_signature.on_attach({}, bufnr)
      local map = require("utils.map")("lsp")
      map({
        desc = "Rename",
        key = "<leader>rn",
        action = vim.lsp.buf.rename,
      })
      map({
        desc = "Code action",
        key = "<leader>ca",
        action = vim.lsp.buf.code_action,
      })
      map({
        desc = "Go to definition",
        key = "gd",
        action = vim.lsp.buf.definition,
      })
      map({
        desc = "Find references",
        key = "gr",
        action = telescope_builtin.lsp_references,
      })
      map({
        desc = "Go to implementation",
        key = "gi",
        action = telescope_builtin.lsp_implementations,
      })
      -- map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
      -- map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
      -- map("gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
      -- map("gr", telescope_builtin.lsp_references, "[g]o to [r]eferences")
      -- map("gI", telescope_builtin.lsp_implementations, "[g]oto [I]mplementation")
      -- map("<leader>D", vim.lsp.buf.type_definition, "[D]efinition")
      -- map("<leader>ds", telescope_builtin.lsp_document_symbols, "[d]ocument [s]ymbols")
      -- map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")
      -- -- See `:help K` for why this keymap
      -- map("K", vim.lsp.buf.hover, "Hover Documentation")
      -- map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
      -- map("gD", vim.lsp.buf.declaration, "[g]o to [d]eclaration")
      -- map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[w]orkspace [a]dd dir")
      -- map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[w]orkspace [r]emove dir")
      -- map(
      --   "<leader>wl",
      --   function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      --   "[w]orkspace [l]ist dirs"
      -- )
    end
    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
      ["gopls"] = function()
        lspconfig.gopls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            gopls = {
              ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true,
              },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                path ~= vim.fn.stdpath("config")
                and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
              then
                return
              end
            end
            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  "${3rd}/luv/library",
                },
              },
            })
          end,
          settings = {
            Lua = {
              telemetry = {
                enable = false,
              },
            },
          },
        })
      end,
    })
  end,
}
