local servers = { 'lua_ls', 'ts_ls', 'biome', 'cssls', 'html' }

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
{
'williamboman/mason-lspconfig.nvim',
config = function()
require('mason-lspconfig').setup({
ensure_installed= servers,
})
end
},
{
      'folke/neodev.nvim',
config = function ()
require('neodev').setup()
end
},
{
'neovim/nvim-lspconfig',
dependencies = {
        'hrsh7th/cmp-nvim-lsp',
},
config = function()
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  for _, server in pairs(servers) do
   lspconfig[server].setup({ capabilities = capabilities })
  end

  vim.keymap.set('n','<leader>r', vim.lsp.buf.rename)
  vim.keymap.set('n','<leader>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n','<leader>gf', vim.lsp.buf.format)
  vim.keymap.set('n','gd', vim.lsp.buf.definition)
  vim.keymap.set('n','gD', vim.lsp.buf.declaration)
  vim.keymap.set('n','gi', vim.lsp.buf.implementation)
  vim.keymap.set('n','gt', vim.lsp.buf.type_definition)
  vim.keymap.set('n','K', vim.lsp.buf.hover)
  vim.keymap.set('n','<C-k>', vim.lsp.buf.signature_help)
  vim.keymap.set('n','<leader>e', vim.diagnostic.open_float)
end
}
}
