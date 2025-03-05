return {
  {
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
  },
  {
    -- Incremental selection/deselection of text.
    -- See https://github.com/SUSTech-data/wildfire.nvim.
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts) require("wildfire").setup(opts) end,
  },
}
