local v = vim

local cs = require('nordic')
cs.setup({
    cursorline = {
        theme = 'light',
    },
    override = {
        Search = {
             link = 'IncSearch', -- prefer current and next search word to have same highlight
        },
    },
})

v.cmd('colorscheme nordic')
