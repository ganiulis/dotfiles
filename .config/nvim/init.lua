vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " " -- Leader key for actions—the space bar

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
vim.opt.relativenumber = true -- Relative line numbers

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "nvchad.options"

      vim.o.cursorlineopt = "both"
    end,
  },
  {
    import = "plugins",
  },
}, require "configs.lazy")

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

for _, file in ipairs {
  "nvchad.autocmds",
  "settings",
} do
  require(file)
end

vim.schedule(function()
  require "mappings"
end)
