return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<C-p>', builtin.git_files)
    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>ft', builtin.treesitter)
    vim.keymap.set('n', '<leader>fw', builtin.grep_string)
    vim.keymap.set('n', '<leader>fs', builtin.live_grep)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    vim.keymap.set('n', 'gr', builtin.lsp_references)
    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols)
  end
}
