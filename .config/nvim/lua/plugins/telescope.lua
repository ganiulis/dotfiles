return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    local map = require("utils.map")("telescope")
    local builtin = require("telescope.builtin")
    map({
      desc = "Search for files",
      key = "<leader>tf",
      action = builtin.find_files,
    })
    map({
      desc = "Search for words",
      key = "<leader>tw",
      action = builtin.live_grep,
    })
    map({
      desc = "Search for buffers",
      key = "<leader>tb",
      action = builtin.buffers,
    })
    map({
      desc = "Search help",
      key = "<leader>th",
      action = builtin.help_tags,
    })
  end,
}
