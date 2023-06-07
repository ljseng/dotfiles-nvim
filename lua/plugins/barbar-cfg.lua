vim.g.barbar_auto_setup = false

require('bufferline').setup {
    animation = false,
    auto_hide = true,
    icons = {
        buffer_index = true,        -- show buffer index for easier jump around buffers
        pinned = {button = '', filename = true},
        filetype = {
            enabled = false,        -- disable icon for filetype
        },
    }
}
