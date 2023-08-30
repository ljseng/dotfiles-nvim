local function toggle_marks_signcolumn()
    vim.cmd('MarksToggleSign')
end

require('toggleterm').setup {
    direction = 'float',
    open_mapping = [[<A-\>]],
    on_open = function(term)
        toggle_marks_signcolumn()
    end,
    on_close = function(term)
        toggle_marks_signcolumn()
    end,
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
