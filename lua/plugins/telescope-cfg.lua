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
        grep_string = {
            disable_devicons = true,
        },
        buffers = {
            disable_devicons = true,
        },
    },
}

telescope.load_extension('notify')

-- to workaround files open using telescope will not have fold calculated (probably due to treesitter not yet ready?)
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx",
})
