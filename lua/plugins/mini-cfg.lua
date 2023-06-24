require('mini.sessions').setup({
    autowrite = false,
    file = 'session.vim',
})

local starter = require('mini.starter')
starter.setup({
    items = {
        starter.sections.recent_files(15, true),    -- current directory, show max 10
        starter.sections.recent_files(5, false),    -- global directory, show max 5
        starter.sections.sessions(5, true),
    },
})

require('mini.align').setup()

require('mini.splitjoin').setup({
  mappings = {
    toggle = 'gs',
  }
})
