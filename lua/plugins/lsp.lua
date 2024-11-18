local servers = {
  astro = {},
  ts_ls = {},
  cssls = {},
  html = {},
  lua_ls = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false }
    }
  }
}

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
        ensure_installed = vim.tbl_keys(servers),
      })
    end
  },
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
          }
        end,
      }

      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    end
  }
}
