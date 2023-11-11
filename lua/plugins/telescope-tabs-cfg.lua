local v = vim

require'telescope-tabs'.setup();

v.keymap.set('n', '<leader>tt', function() require('telescope-tabs').list_tabs() end
    , { desc = 'Telescope find tabs' })
v.keymap.set('n', '<leader>tn', '<Cmd>tabnew<CR>'
    , { desc = 'New tab' })
v.keymap.set('n', '<leader>tx', '<Cmd>tabclose<CR>'
    , { desc = 'Close tab' })
