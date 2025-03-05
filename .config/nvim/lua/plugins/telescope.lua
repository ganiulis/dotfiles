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
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "(Telescope) [f]ind [f]iles" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "(Telescope) [f]ind [w]ords" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "(Telescope) [f]ind [b]uffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "(Telescope) [f]ind [h]elp" })
  end,
}
