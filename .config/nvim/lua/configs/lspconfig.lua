local lspconfig = require "lspconfig"
local nvchad_lspconfig = require "nvchad.configs.lspconfig"

for _, lsp in ipairs { "html", "cssls", "gopls" } do
  lspconfig[lsp].setup {
    on_attach = nvchad_lspconfig.on_attach,
    on_init = nvchad_lspconfig.on_init,
    capabilities = nvchad_lspconfig.capabilities,
  }
end