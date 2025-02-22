return {
  {
    'folke/flash.nvim',
    enabled = false,
  },
  {
    'folke/snacks.nvim',
    opts = {
      explorer = {
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
          },
        },
      },
    },
  },
}
