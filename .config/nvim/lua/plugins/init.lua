return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    config = function() require('configs.conform') end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('nvchad.configs.lspconfig').defaults()
      require('configs.lspconfig')
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      pkgs = {
        'lua-language-server',
        'markdownlint',
        'cssls',
        'yaml-language-server',
      },
      automatic_installation = true,
    },
  },
  {
    -- Better syntax highlighting.
    -- See https://github.com/nvim-treesitter/nvim-treesitter.
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'vim',
        'lua',
        'vimdoc',
        'html',
        'rust',
        'go',
        'yaml',
        'typescript',
        'javascript',
      },
    },
  },
  {
    'ray-x/go.nvim', -- See https://github.com/ray-x/go.nvim.
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function() require('go').setup() end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    lazy = false,
  },
  {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvimtools/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>m',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
    },
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('configs.spectre') end,
  },
}
