require('mini.sessions').setup({
    autowrite = false,
    file = 'session.vim',
})

require('mini.align').setup()

require('mini.splitjoin').setup({
  mappings = {
    toggle = 'gs',
  }
})
