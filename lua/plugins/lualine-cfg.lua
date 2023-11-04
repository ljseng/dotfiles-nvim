local get_str_first_char = function(str)
    return str:sub(1,1)
end

require('lualine').setup {
    options = {
        icons_enabled = false,
        disabled_filetypes = {
            'NvimTree', 'oil', 'toggleterm',
        },
    },
    tabline = {
        lualine_a = { { 'filename', }, },
        lualine_b = { { 'aerial', }, },
        lualine_c = { { 'diagnostics' } },
        lualine_x = { },
        lualine_y = { },
        lualine_z = { { 'tabs', }, },
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = get_str_first_char, },
            { 'branch' },
        },
        lualine_b = {
            { 'buffers', mode = 4 },
        },
        lualine_c = { },
        lualine_x = { 'searchcount' },
        lualine_y = { 'encoding', 'fileformat', },
        lualine_z = { 'location', },
    },
    inactive_sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename', },
        lualine_x = { },
        lualine_y = { },
        lualine_z = { 'location', },
    },
}
