-- Language servers.
local lspconfig = require "lspconfig"
local nvchad_lspconfig = require "nvchad.configs.lspconfig"

-- LSPs with default configurations.
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md.
for _, lsp in ipairs { "marksman", "bashls", "rust_analyzer" } do
  lspconfig[lsp].setup {
    on_attach = nvchad_lspconfig.on_attach,
    on_init = nvchad_lspconfig.on_init,
    capabilities = nvchad_lspconfig.capabilities,
  }
end

-- See https://github.com/mrjosh/helm-ls?tab=readme-ov-file#nvim-lspconfig-setup.
-- lspconfig.helm_ls.setup {
--   settings = {
--     ["helm-ls"] = {
--       yamlls = {
--         path = "yaml-language-server",
--       },
--     },
--   },
-- }

lspconfig.gopls.setup {
  on_attach = nvchad_lspconfig.on_attach,
  on_init = nvchad_lspconfig.on_init,
  capabilities = nvchad_lspconfig.capabilities,
  -- See https://github.com/golang/tools/blob/master/gopls/doc/settings.md.
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
      analyses = {
        fieldalignment = true,
        shadow = true,
        unusedvariable = true,
        useany = true,
      },
      staticcheck = true,
      vulncheck = "Imports",
      gofumpt = true,
    },
  },
}
