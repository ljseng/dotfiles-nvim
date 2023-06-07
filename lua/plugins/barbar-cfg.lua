vim.g.barbar_auto_setup = false

require('bufferline').setup {
    animation = false,
    auto_hide = true,
    icons = {
        pinned = {button = '', filename = true},
    }
}
