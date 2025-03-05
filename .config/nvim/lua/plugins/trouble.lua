return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      diagnostics = {
        auto_close = true, -- auto close when there are no items
        auto_open = false, -- auto open when there are items
      },
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<C-x>",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "(Trouble) Open diagnostics buffer",
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
