local get_str_first_char = function(str)
    return str:sub(1,1)
end

local prepend_git_icon = function (branch_name)
    return ' ' .. branch_name
end

local map_fileformat_icon = function (fileformat)
    if fileformat == 'unix' then return '' end
    if fileformat == 'dos' then return '' end
    if fileformat == 'mac' then return '' end
    return fileformat
end

require('lualine').setup {
    options = {
        icons_enabled = false,
        disabled_filetypes = {
            'NvimTree', 'oil', 'toggleterm',
        },
    },
    tabline = {
        lualine_a = {
            { 'buffers', mode = 4, symbols = { modified = ' +', }, },
        },
        lualine_b = { },
        lualine_c = { },
        lualine_x = { },
        lualine_y = { },
        lualine_z = { { 'tabs', }, },
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = get_str_first_char, },
        },
        lualine_b = { { 'aerial', }, },
        lualine_c = { { 'diagnostics' } },
        lualine_x = { 'searchcount' },
        lualine_y = {
            { 'branch', fmt = prepend_git_icon, },
            { 'fileformat', fmt = map_fileformat_icon, },
            'encoding',
        },
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
