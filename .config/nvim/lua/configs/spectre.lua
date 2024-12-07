-- See https://github.com/nvim-pack/nvim-spectre/issues/249
require('spectre').setup({
  replace_engine = {
    ['sed'] = {
      cmd = 'sed',
      args = {
        '-i',
        '',
        '-E',
      },
    },
  },
})
