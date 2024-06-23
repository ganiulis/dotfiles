local lspconfig = require "lspconfig"
local nvchad_lspconfig = require "nvchad.configs.lspconfig"

for _, lsp in ipairs { "html", "cssls" } do
  lspconfig[lsp].setup {
    on_attach = nvchad_lspconfig.on_attach,
    on_init = nvchad_lspconfig.on_init,
    capabilities = nvchad_lspconfig.capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = nvchad_lspconfig.on_attach,
  on_init = nvchad_lspconfig.on_init,
  capabilities = nvchad_lspconfig.capabilities,
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
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
