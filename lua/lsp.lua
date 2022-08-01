local set = vim.keymap.set
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true }
set('n', '<leader>e', vim.diagnostic.open_float, opts)
set('n', '[d', vim.diagnostic.goto_prev, opts)
set('n', ']d', vim.diagnostic.goto_next, opts)
set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, buffer=bufnr }
  set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  set('n', 'gd', vim.lsp.buf.definition, bufopts)
  set('n', 'K', vim.lsp.buf.hover, bufopts)
  set('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
  set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  set('n', '<leader>ld', vim.lsp.buf.type_definition, bufopts)
  set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  set('n', 'gr', vim.lsp.buf.references, bufopts)
  set('n', '<leader>=', vim.lsp.buf.formatting_sync, bufopts)
end

require('lspconfig').sourcekit.setup{
  on_attach = on_attach
}
