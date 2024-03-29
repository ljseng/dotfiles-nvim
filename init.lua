-- initialize packer
if not vim.g.vscode then
    require('packer_init')
end

require('core/options')
require('core/keymaps')

-- plugin specific configuration
if not vim.g.vscode then
    require('plugins/colorscheme-cfg')
    require('plugins/nvim-tree-cfg')
    require('plugins/lualine-cfg')
    require('plugins/nvim-treesitter-cfg')
    require('plugins/lsp-cfg')
    require('plugins/toggleterm-cfg')
    require('plugins/gitsigns-cfg')
    require('plugins/aerial-cfg')
    require('plugins/telescope-cfg')
    require('plugins/luasnip-cfg')
    require('plugins/marks-cfg')
    require('plugins/nvim-notify-cfg')
    require('plugins/nvim-context-vt-cfg')
    require('plugins/oil-cfg')
    require('plugins/mini-cfg')
    require('plugins/rust-tools-cfg')
    require('plugins/neoformat-cfg')
    require('plugins/harpoon-cfg')
end

