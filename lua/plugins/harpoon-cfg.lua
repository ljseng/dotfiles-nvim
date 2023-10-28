local v = vim

require("harpoon").setup()

local harp_menu = require("harpoon.mark")
local harp_ui = require("harpoon.ui")

-- harpoon the file and notify
local harp_add_file = function()
    harp_menu.add_file()
    local bufname = v.fn.bufname(v.fn.bufnr('%'))
    local msg = "Harpooned '" .. bufname .. "'"
    v.notify(msg, 'info', {
        title = 'Harpoon',
    })
end

-- integrate with telescope extensions
v.keymap.set('n', '<leader>fh', function() require('telescope').extensions.harpoon.marks({ hidden = true }) end
    , { noremap=true, silent=true, desc='Telescope find harpoon marks'})

-- keymaps for harpoon
v.keymap.set('n', '<leader>hh', harp_add_file
	, { noremap=true, silent=true, desc='Harpoon mark a file' })
v.keymap.set('n', '<leader>hi', function () harp_ui.toggle_quick_menu() end
	, { noremap=true, silent=true, desc='Harpoon toggle mark menu' })
v.keymap.set('n', ']h', function () harp_ui.nav_next() end
	, { noremap=true, silent=true, desc='Next harpoon mark' })
v.keymap.set('n', '[h', function () harp_ui.nav_prev() end
	, { noremap=true, silent=true, desc='Previous harpoon mark' })

v.keymap.set('n', '<leader>h1', function () harp_ui.nav_file(1) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 1' })
v.keymap.set('n', '<leader>h2', function () harp_ui.nav_file(2) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 2' })
v.keymap.set('n', '<leader>h3', function () harp_ui.nav_file(3) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 3' })
v.keymap.set('n', '<leader>h4', function () harp_ui.nav_file(4) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 4' })
v.keymap.set('n', '<leader>h5', function () harp_ui.nav_file(5) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 5' })
v.keymap.set('n', '<leader>h6', function () harp_ui.nav_file(6) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 6' })
v.keymap.set('n', '<leader>h7', function () harp_ui.nav_file(7) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 7' })
v.keymap.set('n', '<leader>h8', function () harp_ui.nav_file(8) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 8' })
v.keymap.set('n', '<leader>h9', function () harp_ui.nav_file(9) end
	, { noremap=true, silent=true, desc='Go to harpoon marked file 9' })
