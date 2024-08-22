local lspconfig = require "lspconfig"
local nvchad_lspconfig = require "nvchad.configs.lspconfig"

for _, lsp in ipairs { "templ", "marksman", "bashls", "tsserver", "cssls" } do
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
  settings = { -- See https://github.com/golang/tools/blob/master/gopls/doc/settings.md.
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
