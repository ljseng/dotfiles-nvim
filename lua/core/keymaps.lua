-- --------------------------------------------------------------------------------------------
-- function to help keymapping
-- default options: non-recursive map + silent
-- --------------------------------------------------------------------------------------------
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true } -- default options

    -- overwrite default options
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    -- set keymap
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- space is leader key
vim.g.mapleader = ' '

-- --------------------------------------------------------------------------------------------
-- all mappings
-- --------------------------------------------------------------------------------------------
map('n', 'Y', 'y$')                             -- yank from current position to end of line
map('n', 'n', 'nzzzv')                          -- go to to next search and center the cursor
map('n', 'N', 'Nzzzv')                          -- go to to previous search and center the cursor

-- --------------------------------------------------------------------------------------------
-- manage file
-- --------------------------------------------------------------------------------------------
map('n', '<leader>w', ':w<CR>')                 -- save file
map('n', '<leader>q', ':q<CR>')                 -- quit file
map('n', '<leader>Q', ':q!<CR>')                -- quit file dumping changes
map('n', '<leader>f', ':find<space>')           -- find file

-- --------------------------------------------------------------------------------------------
-- buffers management
-- --------------------------------------------------------------------------------------------
map('n', '<leader>bb', ':ls!<CR>')              -- list all buffers
map('n', '<leader>bd', ':bdelete<CR>')          -- delete buffer
map('n', '<leader>bp', ':bprevious<CR>')        -- go to previous buffer
map('n', '<leader>bn', ':bnext<CR>')            -- go to next buffer

-- split buffers
map('n', '<leader>es', '<C-w>v')                -- split buffer vertically
map('n', '<leader>eS', '<C-w>s')                -- split buffer horizontally

-- resize buffers
map('n', '<C-Right>', '<C-w>10>')               -- increase width by 10 columns
map('n', '<C-Left>', '<C-w>10<')                -- decrease width by 10 columns
map('n', '<C-Up>', '<C-w>10+')                  -- increase height by 10 rows
map('n', '<C-Down>', '<C-w>10-')                -- decrease height by 10 rows
map('n', '<leader>e=', '<C-w>=')                -- make all window equal size

-- moving around buffers
map('n', '<leader>eh', '<C-w>h')                -- go to left buffer
map('n', '<leader>ej', '<C-w>j')                -- go to top buffer
map('n', '<leader>ek', '<C-w>k')                -- go to bottom buffer
map('n', '<leader>el', '<C-w>l')                -- go to right buffer

map('n', '<leader>ew', '<C-w>w')                -- go to next buffers
map('n', '<leader>ex', '<C-w>x')                -- swap adjacent buffers
map('n', '<leader>er', '<C-w>r')                -- rotate buffer clockwise
map('n', '<leader>eR', '<C-w>R')                -- rotate buffer anti-clockwise

-- --------------------------------------------------------------------------------------------
-- cursor movement
-- --------------------------------------------------------------------------------------------
map('n', '<leader>o', '<C-o>zzzv')              -- jump out of jump list and center the cursor
map('n', '<leader>i', '<C-i>zzzv')              -- jump into jump list and center the cursor
map('n', '<leader>[', '[{zzzv')                 -- jump into code block begin and center the cursor
map('n', '<leader>]', ']}zzzv')                 -- jump into code block end and center the cursor

-- --------------------------------------------------------------------------------------------
-- toggle
-- --------------------------------------------------------------------------------------------
map('n', '<leader>vc', ':set cul! cuc!<CR>')    -- highlight cursor line and column
map('n', '<leader>vl', ':set list!<CR>')        -- show unprintable characters
map('n', '<leader>vw', ':set wrap!<CR>')        -- toggle line wrap
map('n', '<leader>vs', ':nohl<CR>')             -- clear search highlight

-- --------------------------------------------------------------------------------------------
-- netrw
-- --------------------------------------------------------------------------------------------
map('n', '<leader>ee', ':NvimTreeFindFileToggle<CR>')         -- open nvim-tree

