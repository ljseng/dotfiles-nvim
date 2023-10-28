local get_str_first_char = function(str)
    return str:sub(1,1)
end

require('lualine').setup {
    options = {
        icons_enabled = false,
        disabled_filetypes = { 'NvimTree' } -- do not show lualine in these places
    },
    sections = {
        lualine_a = { { 'mode', fmt = get_str_first_char } },
        lualine_c = {
            'filename',
            'aerial'
        },
    },
    inactive_sections = {
        lualine_c = {
            'filename',
        },
    },
}
