local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}

telescope.load_extension('aerial')
telescope.load_extension('notify')
