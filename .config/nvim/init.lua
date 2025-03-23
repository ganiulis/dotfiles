require("lazypath")
require("config")
require("lazy").setup({
  spec = {
    {
      import = "plugins",
    },
  },
  checker = {
    enabled = true,
  },
})
require("mappings")
