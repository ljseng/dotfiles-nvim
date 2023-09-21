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
        map('n', ']h', function()
            if vim.wo.diff then return '<leader>h.' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- go to previous hunk
        map('n', '[h', function()
            if vim.wo.diff then return '<leader>h,' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- reset changes
        map('n', '<leader>hr', gs.reset_hunk)       -- reset a hunk
        map('n', '<leader>hR', gs.reset_buffer)     -- reset entire buffer

        -- staging
        map('n', '<leader>hs', gs.stage_hunk)       -- stage hunk
        map('n', '<leader>hS', gs.stage_buffer)     -- stage entire buffer

        -- diff
        map('n', '<leader>hd', gs.diffthis)                         -- diff current version changes
        map('n', '<leader>hD', function() gs.diffthis('~') end)     -- diff current version versus immediate previous version

        -- misc
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{ full = true } end)
    end
}
