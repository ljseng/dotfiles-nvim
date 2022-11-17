require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- keymaps
        -- go to next hunk
        map('n', '<leader>h.', function()
            if vim.wo.diff then return '<leader>h.' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- go to previous hunk
        map('n', '<leader>h,', function()
            if vim.wo.diff then return '<leader>h,' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '<leader>hr', gs.reset_hunk)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{ full = true } end)
        map('n', '<leader>hd', gs.diffthis)
    end
}
