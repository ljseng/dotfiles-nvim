local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_strategy = 'vertical',
    },
}

telescope.load_extension('aerial')
telescope.load_extension('notify')
