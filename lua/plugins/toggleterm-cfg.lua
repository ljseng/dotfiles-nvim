local v = vim

local function toggle_marks_signcolumn()
    v.cmd('MarksToggleSign')
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

function LAZYGIT_TOGGLE()
  lazygit:toggle()
end

v.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true, desc = 'Toggleterm LazyGit'})
v.api.nvim_set_keymap("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<CR>", {noremap = true, silent = true, desc = 'Toggleterm horizontal'})
v.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", {noremap = true, silent = true, desc = 'Toggleterm float'})
