local o = vim.opt
local g = vim.g

-- disable netrw in favor of nvim-tree plugin
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- general
o.mouse = 'a'                                 -- can use mouse
o.clipboard = 'unnamedplus'                   -- use system clipboard
o.swapfile = false                            -- disable swap file
o.completeopt = 'menuone,noinsert,noselect'   -- insert mode autocomplete options

o.path:append { '**' }            -- find a file recursively

-- memory
o.hidden = true                   -- hide buffer if abondoned
o.history = 100                   -- remember n history
o.synmaxcol = 240                 -- max columns to syntax highlight
o.lazyredraw = true               -- faster scrolling
o.updatetime = 700                -- ms to wait for trigger an event

-- user interface
o.number = true                   -- show line number
o.relativenumber = true           -- use relative line number
o.scrolloff = 5                   -- number of lines visible above and below cursor
o.showmatch = true                -- highlight matching parenthesis
o.splitright = true               -- vertical split to right
o.splitbelow = true               -- horizontal split to bottom
o.laststatus = 2                  -- always show status line
o.ruler = true                    -- show ruler at status line
o.linebreak = true                -- wrap on word boundary
o.foldmethod = 'manual'           -- code folding
o.listchars = 'eol:¶,space:␣'     -- to better identify whitespace
o.signcolumn = 'auto:4'           -- auto resize sign column up to given number. for: gitsigns, marks

-- colorscheme with plugin
o.termguicolors = true
vim.cmd('colorscheme everforest')

-- searching
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- indentation
o.expandtab = true          -- use spaces for tab
o.shiftwidth = 4
o.tabstop = 4
o.autoindent = true
o.smartindent = true

vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}') -- highlight yanked text briefly

vim.notify = require('notify')      -- notification with notify plugin

-- autocmd

-- to notify when a buffer is written
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('MyBufWritePost', { clear = true }),
    callback = function()
        local current_buffer_full_name = vim.api.nvim_buf_get_name(0)
        local current_buffer_relative_name = vim.fn.fnamemodify(current_buffer_full_name, ':~:.')
        local notify_msg = string.format("%s successfully written!", current_buffer_relative_name)

        vim.notify(notify_msg, 'info', {
            title = 'Buffer written'
        })
    end,
})
