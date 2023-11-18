local v = vim

local cs = require('nordic')
cs.setup({
    cursorline = {
        theme = 'light',
    }
})

v.cmd('colorscheme nordic')
