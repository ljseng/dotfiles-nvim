require('mason').setup()

require('mason-lspconfig').setup {
    automatic_installation = true
}

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>gk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>gc', vim.lsp.buf.code_action, bufopts)
end

require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- the nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').phpactor.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
