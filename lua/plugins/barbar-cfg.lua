vim.g.barbar_auto_setup = false

require('bufferline').setup {
    animation = false,
    auto_hide = true,
    icons = {
        button = '',                                -- close button
        modified = {button = ''},
        pinned = {button = '', filename = true},
    }
}
