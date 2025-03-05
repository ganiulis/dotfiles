return {
  {
    -- Advanced syntax highlighting engine.
    -- See https://github.com/nvim-treesitter/nvim-treesitter.
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "go",
        "lua",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
}
