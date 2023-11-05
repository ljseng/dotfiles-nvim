local v = vim
local aerial = require('aerial')

aerial.setup {
    layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = { 20, 0.1 }
    },
    nerd_font = false,
}


v.keymap.set('n', ']a', '<Cmd>AerialNext<CR>'
    , { desc = 'Next document symbol using aerial' })
v.keymap.set('n', ']A', '<Cmd>AerialPrev<CR>'
    , { desc = 'Previous document symbol using aerial' })
