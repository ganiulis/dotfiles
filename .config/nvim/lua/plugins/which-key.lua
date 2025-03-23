return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = true }) end,
      desc = "[which-key] Show shortcuts",
    },
  },
}
