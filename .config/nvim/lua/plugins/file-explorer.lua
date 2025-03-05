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
    require("nvim-tree").setup(opts)
    local map = function(key, func, desc)
      if desc then desc = "(NvimTree) " .. desc end
      vim.keymap.set("n", key, func, { noremap = true, silent = true, desc = desc })
    end
    map("<leader>e", function()
      if vim.bo.filetype == "NvimTree" then
        -- Jump to the previous buffer, which should be the file explorer
        vim.cmd("wincmd p")
      else
        -- Focus on the file explorer and open it if it's closed
        require("nvim-tree.api").tree.find_file({ open = true, focus = true })
      end
    end, "Switch between the opened file or the file explorer")
    map("<C-n>", ":NvimTreeToggle<CR>", "Toggle file explorer")
    map("<C-c>", ":NvimTreeCollapse<CR>", "Collapse file explorer")
  end,
}
