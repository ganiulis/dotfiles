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
  rocks = {
    enabled = false, -- Whether https://luarocks.org is used or not.
  },
})
require("mappings")
