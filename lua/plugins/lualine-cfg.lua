require('lualine').setup {
    options = {
        icons_enabled = false,
        disabled_filetypes = { 'NvimTree' } -- do not show lualine in these places
    },
    sections = {
        lualine_c = {} -- originally was filename. purposely set to nothing. filename to be shown at winbar
    },
    inactive_sections = {
        lualine_c = {} -- originally was filename. purposely set to nothing. filename to be shown at winbar
    },
    winbar = {
        lualine_c = {
            'filename',
            'aerial'
        },
    },
    inactive_winbar = {
        lualine_c = {
            'filename',
            'aerial'
        },
    }
}
