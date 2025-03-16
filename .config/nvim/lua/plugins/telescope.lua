return {
  -- Fancy fuzzy search plugin.
  -- See https://github.com/nvim-telescope/telescope.nvim.
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    local builtin = require("telescope.builtin")
    local map = function(key, func, desc)
      if desc then desc = "(Telescope) " .. desc end
      vim.keymap.set("n", key, func, { desc = desc })
    end
    map("<leader>ff", builtin.find_files, "[f]ind [f]iles")
    map("<leader>fw", builtin.live_grep, "[f]ind [w]ords")
    map("<leader>fb", builtin.buffers, "[f]ind [b]uffers")
    map("<leader>fh", builtin.help_tags, "[f]ind [h]elp")
  end,
}
