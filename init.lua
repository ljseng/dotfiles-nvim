-- initialize packer
if not vim.g.vscode then
    require('packer_init')
end 

require('core/options')
require('core/keymaps')

-- plugin specific configuration
if not vim.g.vscode then
    require('plugins/nvim-tree-cfg')
    require('plugins/lualine-cfg')
    require('plugins/barbar-cfg')
    require('plugins/nvim-treesitter-cfg')
    require('plugins/lsp-cfg')
    require('plugins/toggleterm-cfg')
    require('plugins/gitsigns-cfg')
end

