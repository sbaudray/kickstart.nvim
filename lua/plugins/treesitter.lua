return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',

  auto_install = true,

  ensure_installed = { 'json', 'lua', 'tsx', 'typescript', 'scss', 'vimdoc', 'vim' },

  indent = {
    enable = true
  }
}
