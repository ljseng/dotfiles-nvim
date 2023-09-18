-- TODO: discard map function. follow telescope keymap setup style
-- TODO: add description for all keymaps so that is easier to find keymaps using telescope
local v = vim

-- --------------------------------------------------------------------------------------------
-- function to help keymapping
-- default options: non-recursive map + silent
-- --------------------------------------------------------------------------------------------
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true } -- default options

    -- overwrite default options
    if opts then
        options = v.tbl_extend('force', options, opts)
    end

    -- set keymap
    v.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- space is leader key
v.g.mapleader = ' '

-- --------------------------------------------------------------------------------------------
-- all mappings
-- --------------------------------------------------------------------------------------------
map('n', 'Y', 'y$')                             -- yank from current position to end of line

-- --------------------------------------------------------------------------------------------
-- manage file
-- --------------------------------------------------------------------------------------------
map('n', '<leader>w', ':w<CR>')                 -- save file
map('n', '<leader>q', ':q<CR>')                 -- quit file
map('n', '<leader>Q', ':qa<CR>')                -- quit all

-- --------------------------------------------------------------------------------------------
-- buffers management (with barbar)
-- --------------------------------------------------------------------------------------------
map('n', '<leader>bB', ':ls!<CR>')                                      -- list all buffers
map('n', '<leader>bb', ':buffer ', { noremap = true, silent = false })  -- shortcut to type :buffer. can type buffer number of buffer name following after. buffer name can be partial
map('n', '<leader>bc', '<Cmd>BufferClose<CR>')                          -- close buffer
map('n', '<leader>bC', '<Cmd>BufferClose!<CR>')                         -- close unwritten buffer
map('n', '<leader>bN', '<Cmd>BufferPrevious<CR>')                       -- go to previous buffer
map('n', '<leader>bn', '<Cmd>BufferNext<CR>')                           -- go to next buffer
map('n', '<leader>b,', '<Cmd>BufferMovePrevious<CR>')                   -- move buffer previous
map('n', '<leader>b.', '<Cmd>BufferMoveNext<CR>')                       -- move buffer next
map('n', '<leader>bp', '<Cmd>BufferPin<CR>')                            -- pin or unpin a buffer

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
map('n', '<leader>vc', ':NvimContextVtToggle<CR>')      -- toggle code context
map('n', '<leader>vl', ':set list!<CR>')                -- show unprintable characters
map('n', '<leader>vw', ':set wrap!<CR>')                -- toggle line wrap
map('n', '<leader>vs', ':nohl<CR>')                     -- clear search highlight
map('n', '<leader><space>', 'za')                       -- toggle folds

-- --------------------------------------------------------------------------------------------
-- nvim-tree
-- --------------------------------------------------------------------------------------------
map('n', '<leader>ee', ':NvimTreeFindFileToggle<CR>')     -- open nvim-tree and focus on the file

-- --------------------------------------------------------------------------------------------
-- oil
-- --------------------------------------------------------------------------------------------
map('n', '<leader>eo', ':Oil --float<CR>')                -- open oil floating window

-- --------------------------------------------------------------------------------------------
-- telescope
-- --------------------------------------------------------------------------------------------
local builtin = require('telescope.builtin')

-- find files
v.keymap.set('n', '<leader>ff', builtin.find_files
    , { desc = 'Telescope find files exclude hidden' })
v.keymap.set('n', '<leader>fF', function() builtin.find_files({ hidden = true }) end
    , { desc = 'Telescope find files include hidden' })

-- grep for word
v.keymap.set('n', '<leader>fg', builtin.live_grep
    , { desc = 'Telescope grep in the current working directory' })
v.keymap.set('n', '<leader>fG', function() builtin.grep_string({ search_dirs={ v.fn.expand('%:p') }}) end
    , { desc = 'Telescope grep the word under cursor in the current working directory' })

-- lsp related
v.keymap.set('n', '<leader>fA', builtin.lsp_workspace_symbols
    , { desc = 'Telescope find LSP workspace symbols in the current working directory' })
v.keymap.set('n', '<leader>fa', builtin.lsp_document_symbols
    , { desc = 'Telescope find LSP document symbols in the current buffer' })
v.keymap.set('n', '<leader>fi', builtin.lsp_implementations
    , { desc = 'Telescope find LSP implementations for the word under cursor' })
v.keymap.set('n', '<leader>fr', builtin.lsp_references
    , { desc = 'Telescope find LSP references for word under cursor' })
v.keymap.set('n', '<leader>ft', builtin.diagnostics
    , { desc = 'Telescope find LSP diagnostics for all open buffers' })
v.keymap.set('n', '<leader>fT', function() builtin.diagnostics({ bufnr = 0 }) end
    , { desc = 'Telescope find LSP diagnostics for current buffer' })

-- extensions
v.keymap.set('n', '<leader>fn', function() require('telescope').extensions.notify.notify() end
    , { desc = 'Telescope find notification'})
v.keymap.set('n', '<leader>fd', function() require('telescope').extensions.diff.diff_current({ hidden = true }) end
    , { desc = 'Telescope compare file with current'})
v.keymap.set('n', '<leader>fD', function() require('telescope').extensions.diff.diff_files({ hidden = true }) end
    , { desc = 'Telescope compare 2 files'})

-- misc
v.keymap.set('n', '<leader>fb', builtin.buffers
    , { desc = 'Telescope find buffers' })
v.keymap.set('n', '<leader>fc', builtin.commands
    , { desc = 'Telescope find commands' })
v.keymap.set('n', '<leader>fC', builtin.command_history
    , { desc = 'Telescope find recent command histories' })
v.keymap.set('n', '<leader>fm', builtin.marks
    , { desc = 'Telescope find marks' })
v.keymap.set('n', '<leader>fj', builtin.jumplist
    , { desc = 'Telescope find jump list' })
v.keymap.set('n', '<leader>fR', builtin.registers
    , { desc = 'Telescope find registers' })
v.keymap.set('n', '<leader>fk', builtin.keymaps
    , { desc = 'Telescope find keymaps' })
v.keymap.set('n', '<leader>fq', builtin.quickfix
    , { desc = 'Telescope find items in quickfix list' })
v.keymap.set('n', '<leader>fQ', builtin.quickfixhistory
    , { desc = 'Telescope find all quickfix lists in history and open them with builin.quickfix' })

-- --------------------------------------------------------------------------------------------
-- aerial
-- --------------------------------------------------------------------------------------------
v.keymap.set('n', '<leader>/', '<cmd>AerialToggle!<CR>')      -- aerial code outline window at the right

-- --------------------------------------------------------------------------------------------
-- misc
-- --------------------------------------------------------------------------------------------
map('n', '<leader>zz', ':e ~`mktemp`<CR>')    -- create a temporary file in `~/tmp/`
