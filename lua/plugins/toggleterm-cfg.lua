local v = vim

local function toggle_marks_signcolumn()
    v.cmd('MarksToggleSign')
end

require('toggleterm').setup {
    direction = 'float',
    open_mapping = [[<A-\>]],
    size = function(term)
        if term.direction == 'horizontal' then return v.o.lines * 0.4
        elseif term.direction == 'vertical' then return v.o.columns * 0.6
        end
    end,
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
v.api.nvim_set_keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", {noremap = true, silent = true, desc = 'Toggleterm horizontal'})
v.api.nvim_set_keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", {noremap = true, silent = true, desc = 'Toggleterm vertical'})
v.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", {noremap = true, silent = true, desc = 'Toggleterm float'})

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    v.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- hit <esc> in term shall go to normal mode
end

v.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
