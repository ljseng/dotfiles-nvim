local v = vim

local ensure_packer = function()
  local fn = v.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    v.cmd [[packadd packer.nvim]]
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'AlexvZyl/nordic.nvim'

    use {
        'kristijanhusak/vim-dadbod-ui',
        requires = {
            'tpope/vim-dadbod',
            'kristijanhusak/vim-dadbod-completion',
            'pbogut/vim-dadbod-ssh',
        }
    }

    use {
        'stevearc/oil.nvim',
    }

    use {
        'christoomey/vim-tmux-navigator'
    }

    -- nvim-tree - a better file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    -- nvim-notify - notification
    use 'rcarriga/nvim-notify'

    -- lualine - a better statusline
    use 'nvim-lualine/lualine.nvim'

    -- treesitter - a better syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- language server protocol
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- for rust lsp
    use 'simrat39/rust-tools.nvim'

    use 'ray-x/lsp_signature.nvim'

    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'f3fora/cmp-spell'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- gitsigns
    use 'lewis6991/gitsigns.nvim'

    -- telescope - a powerful way to fuzzy find files
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }

    use {
        'ThePrimeagen/harpoon',
    }

    use {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
    }

    -- indentation guideline
    use 'lukas-reineke/indent-blankline.nvim'

    -- aerial - for code outline
    use 'stevearc/aerial.nvim'

    -- nvim_context_vt
    use 'haringsrob/nvim_context_vt'

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- marks - better experience using marks
    use 'chentoast/marks.nvim'

    -- auto comment
    use {
        'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup {} end
    }

    -- surround
    use({
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({
                -- configuration here, or leave empty to use defaults
            })
        end
    })

    -- friendly snippet - snippet to write code faster
    use 'rafamadriz/friendly-snippets'

    -- mini
    use 'echasnovski/mini.nvim'

    -- code formatter
    use 'sbdchd/neoformat'

    -- toggleterm
    use 'akinsho/toggleterm.nvim'

    -- diff files using telescope
    use {
        'jemag/telescope-diff.nvim',
        requires = {
            'nvim-telescope/telescope.nvim'
        }
    }

    -- diff directory
    use 'will133/vim-dirdiff'

    -- handy git wrapper
    use 'tpope/vim-fugitive'

    -- better searching for word
    use 'rlane/pounce.nvim'

    use {
        "Gelio/cmp-natdat",
        config = function()
            require("cmp_natdat").setup()
        end
    }

    -- automatically set up configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
