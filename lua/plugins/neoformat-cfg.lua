local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true } -- default options

    -- overwrite default options
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    -- set keymap
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_set_var('neoformat_try_node_exe', 1)       -- use node module executable

map('n', '<leader>p', '<Cmd>Neoformat<CR>')             -- keymap to quickly format using Neoformat
