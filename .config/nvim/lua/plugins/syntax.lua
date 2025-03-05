return {
  -- Advanced syntax highlighting engine.
  -- See https://github.com/nvim-treesitter/nvim-treesitter.
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
