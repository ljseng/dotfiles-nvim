local o = vim.opt
local g = vim.g

-- disable netrw in favor of nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- general
o.mouse = 'a'                                 -- can use mouse
o.clipboard = 'unnamedplus'                   -- use system clipboard
o.swapfile = false                            -- disable swap file
o.completeopt = 'menuone,noinsert,noselect'   -- insert mode autocomplete options

vim.cmd(':set path+=**')          -- find a file recursively

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

vim.notify = require('notify')      -- notification
