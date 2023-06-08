local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    pickers = {
        find_files = {
            disable_devicons = true,
        },
        live_grep = {
            disable_devicons = true,
        },
        buffers = {
            disable_devicons = true,
        },
    },
}

telescope.load_extension('aerial')
telescope.load_extension('notify')
