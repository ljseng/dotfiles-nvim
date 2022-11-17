require('toggleterm').setup {
    direction = 'float',
    open_mapping = [[<A-\>]],
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
