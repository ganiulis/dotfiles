return {
  {
    -- LSP binary manager.
    "williamboman/mason.nvim",
    ---@param opts MasonSettings
    config = function(_, opts) require("mason").setup(opts) end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    ---@param opts MasonLspconfigSettings
    config = function(_, opts) require("mason-lspconfig").setup(opts) end,
  },
  {
    -- Installs LSPs automatically.
    -- Depends on mason.nvim
    -- Run `:MasonToolsClean` from time to time to remove unlisted packages.
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "gofumpt", -- Go formatter
        "goimports", -- Go imports formatter
        "gopls", -- Go LSP
        "lua-language-server", -- Lua LSP
        "marksman", -- Markdown LSP
        "prettier", -- General purpose formatter
        "stylua", -- Lua formatter
      },
      auto_update = true,
    },
    config = function(_, opts) require("mason-tool-installer").setup(opts) end,
  },
}
