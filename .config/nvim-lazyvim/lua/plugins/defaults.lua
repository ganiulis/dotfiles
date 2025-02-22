return {
  {
    'folke/flash.nvim',
    enabled = false,
  },
  {
    'neovim/nvim-lspconfig',
    enabled = false,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    enabled = false,
  },
  {
    'neovim/nvim-lspconfig',
    enabled = false,
  },
  {
    'folke/persistence.nvim',
    enabled = false,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'marksman',
        'prettier',
      },
    },
  },
}
