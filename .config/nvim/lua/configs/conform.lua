local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
