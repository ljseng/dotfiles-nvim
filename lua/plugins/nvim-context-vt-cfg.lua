local v = vim

require('nvim_context_vt').setup({
    enabled = false     -- disable by default. prefer to manual turn it on demand. added keymap to manual toggle
})

v.keymap.set('n', '<leader>vc', '<Cmd>NvimContextVtToggle<CR>'
    , { noremap=true, silent=true, desc='Toggle code context' })
