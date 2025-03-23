return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      diagnostics = {
        auto_close = true,
        auto_open = false,
      },
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[trouble] Open diagnostics buffer",
    },
    -- {
    -- "<leader>dX",
    -- "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    -- desc = "(Trouble) Buffer Diagnostics",
    -- },
    -- {
    --   "<leader>cs",
    --   "<cmd>Trouble symbols toggle focus=false<cr>",
    --   desc = "(Trouble) Symbols",
    -- },
    -- {
    --   "<leader>cl",
    --   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --   desc = "(Trouble) LSP Definitions / references / ...",
    -- },
    -- {
    --   "<leader>dL",
    --   "<cmd>Trouble loclist toggle<cr>",
    --   desc = "(Trouble) Location list",
    -- },
    -- {
    --   "<leader>dQ",
    --   "<cmd>Trouble qflist toggle<cr>",
    --   desc = "(Trouble) Quickfix list",
    -- },
  },
}
