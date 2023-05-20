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
-- insert mode F1 - F12 mappings
-- --------------------------------------------------------------------------------------------
map('i', '<F1>', '<C-r>=system("date +%F | tr -d \'\\n\'")', { noremap = true, silent = false })    -- get current date into current cursor position

-- --------------------------------------------------------------------------------------------
-- manage file
-- --------------------------------------------------------------------------------------------
map('n', '<leader>w', ':w<CR>')                 -- save file
map('n', '<leader>q', ':q<CR>')                 -- quit file
map('n', '<leader>Q', ':q!<CR>')                -- quit file dumping changes

-- --------------------------------------------------------------------------------------------
-- buffers management (with barbar)
-- --------------------------------------------------------------------------------------------
map('n', '<leader>bB', ':ls!<CR>')                                      -- list all buffers
map('n', '<leader>bb', ':buffer ', { noremap = true, silent = false })  -- shortcut to type :buffer. can type buffer number of buffer name following after. buffer name can be partial
map('n', '<leader>bc', '<Cmd>BufferClose<CR>')                          -- close buffer
map('n', '<leader>bp', '<Cmd>BufferPrevious<CR>')                       -- go to previous buffer
map('n', '<leader>bn', '<Cmd>BufferNext<CR>')                           -- go to next buffer
map('n', '<leader>b,', '<Cmd>BufferMovePrevious<CR>')                   -- move buffer previous
map('n', '<leader>b.', '<Cmd>BufferMoveNext<CR>')                       -- move buffer next

-- go to N buffer
map('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>')
map('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>')
map('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>')
map('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>')
map('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>')
map('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>')
map('n', '<leader>b7', '<Cmd>BufferGoto 7<CR>')
map('n', '<leader>b8', '<Cmd>BufferGoto 8<CR>')
map('n', '<leader>b9', '<Cmd>BufferGoto 9<CR>')
map('n', '<leader>b0', '<Cmd>BufferLast<CR>')

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
-- nvim-tree
-- --------------------------------------------------------------------------------------------
map('n', '<leader>ee', ':NvimTreeFindFileToggle<CR>')     -- open nvim-tree and focus on the file

-- --------------------------------------------------------------------------------------------
-- telescope
-- --------------------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})       -- fuzzy find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})        -- grep within directory.external dependency: ripgrep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})          -- find buffers
vim.keymap.set('n', '<leader>fc', builtin.commands, {})         -- find commands
vim.keymap.set('n', '<leader>fm', builtin.marks, {})            -- find marks
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})         -- find jumplist
vim.keymap.set('n', '<leader>fr', builtin.registers, {})        -- find registers
vim.keymap.set('n', '<leader>ft', '<Cmd>Telescope aerial<CR>', {})

-- --------------------------------------------------------------------------------------------
-- aerial
-- --------------------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>/', '<cmd>AerialToggle!<CR>')

-- --------------------------------------------------------------------------------------------
-- misc
-- --------------------------------------------------------------------------------------------
map('n', '<leader>zz', ':e ~`mktemp`<CR>')    -- create a temporary file in `~/tmp/`
