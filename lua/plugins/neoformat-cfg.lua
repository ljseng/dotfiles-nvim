local v = vim

v.api.nvim_set_var('neoformat_try_node_exe', 1)       -- use node module executable

v.keymap.set('n', '<leader>p', '<Cmd>Neoformat<CR>'
    , { desc = 'Format entire buffer' })
