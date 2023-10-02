require('gitsigns').setup {
    signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '-' },
        topdelete    = { text = '^' },
        changedelete = { text = '_' },
        untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- keymaps
        -- go to next hunk
        map('n', ']g', function()
            if vim.wo.diff then return '<leader>h.' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- go to previous hunk
        map('n', '[g', function()
            if vim.wo.diff then return '<leader>h,' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- reset changes
        map('n', '<leader>gu', gs.reset_hunk)       -- reset a hunk
        map('n', '<leader>gU', gs.reset_buffer)     -- reset entire buffer

        -- staging
        map('n', '<leader>gw', gs.stage_hunk)       -- stage hunk
        map('n', '<leader>gW', gs.stage_buffer)     -- stage entire buffer

        -- diff
        map('n', '<leader>gd', gs.diffthis)                         -- diff current version changes
        map('n', '<leader>gD', function() gs.diffthis('~') end)     -- diff current version versus immediate previous version

        -- misc
        map('n', '<leader>gk', gs.preview_hunk)
        map('n', '<leader>gb', function() gs.blame_line{ full = true } end)
    end
}
