return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      markdown = { "prettier" },
      fish = { "fish_indent" },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args) require("conform").format({ bufnr = args.buf }) end,
    })

    require("conform").setup(opts)
  end,
}
