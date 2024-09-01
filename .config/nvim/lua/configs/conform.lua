-- Formatters.
-- See https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters.
require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier", "markdownfmt" },
    rust = { "rustfmt" },
    typescript = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 800,
    lsp_fallback = true,
  },
}
