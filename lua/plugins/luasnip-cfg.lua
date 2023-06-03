require('luasnip.loaders.from_vscode').lazy_load({
    include = {
        'c',
        'css',
        'html',
        'javascript',
        'lua',
        'markdown',
        'php',
        'sql'
    }
})

local ls = require('luasnip')
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
    all = {
        -- today's date
        snip({
            trig = '@today',
            namr = 'Today date',
            dscr = 'Today date in the form of YYYY-MM-DD',
        }, {
            func(
                function()
                    return {os.date('%Y-%m-%d')}
                end
                , {}
            ),
        }),
        -- today's datetime
        snip({
            trig = '@now',
            namr = 'Today datetime',
            dscr = 'Today datetime in the form of YYYY-MM-DDTH.M.S',
        }, {
            func(
                function()
                    return {os.date('%Y-%m-%dT%H.%M.%S')}
                end
                , {}
            ),
        }),
    },
})
