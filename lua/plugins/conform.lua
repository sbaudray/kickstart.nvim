return {
  'stevearc/conform.nvim',

  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        astro = { 'prettier' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        jsx = { 'prettierd' },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback'
      }
    })
  end
}
