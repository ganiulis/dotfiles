return {
  -- File explorer with LSP integration.
  -- See https://github.com/nvim-tree/nvim-tree.lua.
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    renderer = {
      group_empty = true,
    },
  },
  config = function(_, opts)
    vim.keymap.set("n", "<leader>e", function()
      if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd p") -- Jump to the previous buffer, which should be the file explorer
      else
        require("nvim-tree.api").tree.find_file({ open = true, focus = true }) -- Focus on the file explorer and open it if it's closed
      end
    end, {
      noremap = true,
      silent = true,
      desc = "(NvimTree) Switch between the opened file or the file explorer",
    })
    vim.keymap.set(
      "n",
      "<C-n>",
      ":NvimTreeToggle<CR>",
      { noremap = true, silent = true, desc = "(NvimTree) Toggle file explorer" }
    )
    vim.keymap.set(
      "n",
      "<C-c>",
      ":NvimTreeCollapse<CR>",
      { noremap = true, silent = true, desc = "(NvimTree) Collapse file explorer" }
    )
    require("nvim-tree").setup(opts)
  end,
}
