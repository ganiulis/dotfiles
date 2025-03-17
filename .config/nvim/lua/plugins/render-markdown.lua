-- Markdown visualizer.
-- Recommended by https://github.com/lukas-reineke/headlines.nvim.
-- See https://github.com/MeanderingProgrammer/render-markdown.nvim.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    completions = {
      lsp = {
        enabled = true,
      },
    },
  },
  config = function(_, opts) require("render-markdown").setup(opts) end,
}
