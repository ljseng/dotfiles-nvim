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

-- --------------------------------------------------------------------------------------------
-- various helper functions
-- --------------------------------------------------------------------------------------------
local copy_bufname_into_unnamed_reg = function()
    local bufname = v.fn.bufname('%')
    if bufname then
        bufname = v.fn.fnamemodify(bufname, ':t')
        v.fn.setreg('"', bufname);
        local msg = "Copied buffer name '" .. bufname .. "' into unnamed register"
        v.notify(msg, 'info', {
            title = 'Yank',
        })
    else
        bufname = nil
        v.notify('Failed to get buffer name', 'warn', {
            title = 'Yank',
        })
    end
end

-- space is leader key
v.g.mapleader = ' '

-- --------------------------------------------------------------------------------------------
-- all mappings
-- --------------------------------------------------------------------------------------------
v.keymap.set('n', 'Y', 'y$'
    , { noremap=true, silent=true, desc='Yank from current position to end of line' })
v.keymap.set('n', 'yn', copy_bufname_into_unnamed_reg
    , { noremap=true, silent=true, desc='Yank current buffer name into unnamed register' })

-- --------------------------------------------------------------------------------------------
-- manage file
-- --------------------------------------------------------------------------------------------
map('n', '<leader>w', ':w<CR>')                 -- save file
map('n', '<leader>x', ':q<CR>')                 -- quit file
map('n', '<leader>X', ':qa<CR>')                -- quit all

-- --------------------------------------------------------------------------------------------
-- more sensible search for word. favor none exact search. `G` to do exact search
-- --------------------------------------------------------------------------------------------
v.keymap.set('n', '*', 'g*Nzzzv' , { noremap=true, })
v.keymap.set('n', '#', 'g#Nzzzv' , { noremap=true, })
v.keymap.set('n', 'g*', '*Nzzzv' , { noremap=true, })
v.keymap.set('n', 'g#', '#Nzzzv' , { noremap=true, })

-- --------------------------------------------------------------------------------------------
-- buffers management
-- --------------------------------------------------------------------------------------------
v.keymap.set('n', '<leader>bl', ':ls<CR>'
    , { noremap=true, silent=true, desc='Open buffer list' })
v.keymap.set('n', '<leader>bL', ':ls!<CR>'
    , { noremap=true, silent=true, desc='Open buffer list including unlisted' })
v.keymap.set('n', '<leader>bb', ':b '
    , { noremap=true, silent=false, desc='Open buffer [N] from buffer list. [N] could be buffer number or buffer name (can tab completion)' })
v.keymap.set('n', '<leader>bd', ':bd '
    , { noremap=true, silent=false, desc='Delete buffer [N] from buffer list. [N] could be buffer number or buffer name (can tab completion)' })
v.keymap.set('n', '<leader>bx', ':bd %<CR>'
    , { noremap=true, silent=true, desc='Delete current buffer' })
v.keymap.set('n', '<leader>bX', ':bd! %<CR>'
    , { noremap=true, silent=true, desc='Delete current buffer and discard any unsaved changes' })
v.keymap.set('n', ']b', ':bn<CR>'
    , { noremap=true, silent=true, desc='Next buffer' })
v.keymap.set('n', '[b', ':bp<CR>'
    , { noremap=true, silent=true, desc='Previous buffer' })

-- split buffers
v.keymap.set('n', '<leader>bs', ':vert sb '
    , { noremap=true, silent=false, desc='Vertically split buffer [N] from the buffer list. [N] could be buffer number or buffer name (can tab completion)' })
v.keymap.set('n', '<leader>es', '<C-w>v'
    , { noremap=true, silent=true, desc='Split current buffer vertically' })
v.keymap.set('n', '<leader>eS', '<C-w>s'
    , { noremap=true, silent=true, desc='Split current buffer horizontally' })
v.keymap.set('n', '<leader>et', '<C-w>v<C-w>T'
    , { noremap=true, silent=true, desc='Open current buffer at new tab' })

-- resize buffers
map('n', '<A-Right>', '<C-w>5>')               -- increase width by 5 columns
map('n', '<A-Left>', '<C-w>5<')                -- decrease width by 5 columns
map('n', '<A-Up>', '<C-w>5+')                  -- increase height by 5 rows
map('n', '<A-Down>', '<C-w>5-')                -- decrease height by 5 rows
map('n', '<leader>e=', '<C-w>=')               -- make all window equal size
map('n', '<leader>e\\', '<C-w>|')              -- make current window full width
map('n', '<leader>e-', '<C-w>_')               -- make current window full height

-- moving around buffers
map('n', '<leader>eh', '<C-w>h')                -- go to left buffer
map('n', '<leader>ej', '<C-w>j')                -- go to top buffer
map('n', '<leader>ek', '<C-w>k')                -- go to bottom buffer
map('n', '<leader>el', '<C-w>l')                -- go to right buffer

map('n', '<leader>ew', '<C-w>w')                -- go to next buffers
map('n', '<leader>ex', '<C-w>x')                -- swap adjacent buffers
map('n', '<leader>er', '<C-w>r')                -- rotate buffer clockwise
map('n', '<leader>eR', '<C-w>R')                -- rotate buffer anti-clockwise

map('n', 'gg', 'gg0')                           -- go to top and first column
map('n', 'G', 'G0')                             -- go to bottom and first column

-- misc
-- TODO: add notification on change success
v.keymap.set('n', '<leader>ez', '<Cmd>cd %:p:h<CR>'
    , { noremap=true, silent=true, desc='Change vim directory to current file' })

v.keymap.set('n', '<F1>', '<Cmd>.!toilet -w 200 -f term -F border<CR>'
    , { noremap=true, silent=true, desc='Enclose current line string with border' })

-- quickfix
map('n', '<leader>qq', '<Cmd>copen<CR>')                                      -- open quickfix
map('n', '<leader>qQ', '<Cmd>cclose<CR>')                                     -- close quickfix
map('n', '<leader>ql', ':cc ', { noremap = true, silent = false })            -- jump to quickfix item
map('n', '<leader>qg', ':grep -riP ', { noremap = true, silent = false })     -- external grep recursively, case-insensitively, and use perl compatible regular expression (PCRE)
map('n', '<leader>qf', ':Cfilter ', { noremap = true, silent = false })       -- further filter quickfix
map('n', ']q', '<Cmd>cnext<CR>zzzv')                                          -- go to next quickfix list item
map('n', '[q', '<Cmd>cprevious<CR>zzzv')                                      -- go to previous quickfix list item
map('n', ']Q', '<Cmd>clast<CR>zzzv')                                          -- go to last quickfix list item
map('n', '[Q', '<Cmd>cfirst<CR>zzzv')                                         -- go to first quickfix list item

-- --------------------------------------------------------------------------------------------
-- cursor movement
-- --------------------------------------------------------------------------------------------
map('n', '<leader>o', '<C-o>zzzv')              -- jump out of jump list and center the cursor
map('n', '<leader>i', '<C-i>zzzv')              -- jump into jump list and center the cursor
map('n', '<leader>[', '[{zzzv')                 -- jump into code block begin and center the cursor
map('n', '<leader>]', ']}zzzv')                 -- jump into code block end and center the cursor
map('n', 'n', 'nzzzv')                          -- jump to next search and center the cursor
map('n', 'N', 'Nzzzv')                          -- jump to previous search and center the cursor

-- --------------------------------------------------------------------------------------------
-- toggle
-- --------------------------------------------------------------------------------------------
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
v.keymap.set('n', '<leader>fG', builtin.grep_string
    , { desc = 'Telescope grep the word under cursor in the current working directory' })

-- lsp related
v.keymap.set('n', '<leader>fA', builtin.lsp_workspace_symbols
    , { desc = 'Telescope find LSP workspace symbols in the current working directory' })
v.keymap.set('n', '<leader>fa', function() require('telescope').extensions.aerial.aerial() end
    , { desc = 'Telescope find LSP document symbols in the current buffer' })
v.keymap.set('n', '<leader>fi', builtin.lsp_implementations
    , { desc = 'Telescope find LSP implementations for the word under cursor' })
v.keymap.set('n', '<leader>fr', builtin.lsp_references
    , { desc = 'Telescope find LSP references for word under cursor' })
v.keymap.set('n', '<leader>ft', builtin.diagnostics
    , { desc = 'Telescope find LSP diagnostics for all open buffers' })
v.keymap.set('n', '<leader>fT', function() builtin.diagnostics({ bufnr = 0 }) end
    , { desc = 'Telescope find LSP diagnostics for current buffer' })

-- git related (fugitive)
v.keymap.set('n', '<leader>gl', builtin.git_commits
    , { desc = 'Telescope find git commits with diff preview, checkout action <Cr>' })
v.keymap.set('n', '<leader>gL', builtin.git_bcommits
    , { desc = 'Telescope find git commits with diff preview for current buffer and check them out on <Cr>' })
v.keymap.set('n', '<leader>gB', builtin.git_branches
    , { desc = 'Telescope find git branches with log preview, checkout action <Cr>, switch action <C-s>, create action <C-a>, delete action <C-d>, merge action <C-y>' })
v.keymap.set('n', '<leader>gt', builtin.git_status
    , { desc = 'Telescope find git status with diff preview and add action' })
v.keymap.set('n', '<leader>gs', builtin.git_stash
    , { desc = 'Telescope find git stash items in current repository with ability to apply them on <Cr>' })

-- git related (fugitive)
v.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>'
    , { desc = 'Git commit' })
v.keymap.set('n', '<leader>gp', '<cmd>Git pull<CR>'
    , { desc = 'Git pull' })
v.keymap.set('n', '<leader>gP', '<cmd>Git push<CR>'
    , { desc = 'Git push' })

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
v.keymap.set('n', '<leader>fl', builtin.loclist
    , { desc = 'Telescope find items in location list' })
v.keymap.set('n', '<leader>fq', builtin.quickfix
    , { desc = 'Telescope find items in quickfix list' })
v.keymap.set('n', '<leader>fQ', builtin.quickfixhistory
    , { desc = 'Telescope find all quickfix lists in history and open them with builin.quickfix' })

-- from pounce plugin
v.keymap.set('n', '<leader>fw', function() require('pounce').pounce({ }) end
    , {desc = 'Pounce for word' })
v.keymap.set('n', '<leader>fW', function() require('pounce').pounce({ do_repeat = true }) end
    , {desc = 'Repeat the last pounced word' })

-- --------------------------------------------------------------------------------------------
-- aerial
-- --------------------------------------------------------------------------------------------
v.keymap.set('n', '<leader>/', '<cmd>AerialToggle!<CR>')      -- aerial code outline window at the right

-- --------------------------------------------------------------------------------------------
-- misc
-- --------------------------------------------------------------------------------------------
map('n', '<leader>zz', ':e ~`mktemp`<CR>')    -- create a temporary file in `~/tmp/`
