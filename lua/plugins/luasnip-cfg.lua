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
    markdown = {
        -- template for task
        snip({
            trig = '@t:task',
            namr = 'Task template',
            dscr = 'Task template',
        }, {
            -- yaml metadata
            text({'---'}),
            text({'','title:       '}), insert(1, 'title'),
            -- status: default open
            --    possible values:
            --      - open: newly captured and no action taken yet
            --      - wip: in progress by myself
            --      - delegated: someone else working on it
            --      - blocked: cannot work on now
            --      - completed: settled
            text({'','# status:    open, wip, delegated, blocked, completed'}),
            text({'','status:      '}), insert(2, 'open'),
            -- priority: default 3
            --    possible values:
            --      - 1: high priority
            --      - 2: medium priority
            --      - 3: low priority
            text({'','# priority:  3, 2, 1'}),
            text({'','priority:    '}), insert(3, '3'),
            -- tags:
            --    possible values:
            --      - bug: production matter
            --      - doc: documentation related task
            --      - enquiry: checking for someone or for myself
            --      - feature: development work
            text({'','# tags:      bug, doc, enquiry, feature'}),
            text({'','tags:        ['}), insert(4, ''), text({']'}),
            text({'','dt_created:  '}), func(function() return {os.date('%Y-%m-%dT%H.%M.%S')} end, {}),
            text({'','dt_modified: '}), func(function() return {os.date('%Y-%m-%dT%H.%M.%S')} end, {}),
            text({'','---',''}),

            -- markdown template
            text({'', '# information', ''}),            -- general information about the task
            insert(0),
            text({'', '# todo', ''}),                   -- divide and conquer a task
            text({'', '# log', ''}),                    -- any progressive update
            text({'', '# conclusion', ''}),             -- concise summary. include action taken
        }),
    }
})
