local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'sainnhe/everforest'

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

    -- barbar - a better way to manage buffers
    use 'romgrk/barbar.nvim'

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

    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- gitsigns
    use 'lewis6991/gitsigns.nvim'

    -- telescope - a powerful way to fuzzy find files
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- indentation guideline
    use 'lukas-reineke/indent-blankline.nvim'

    -- aerial - for code outline
    use 'stevearc/aerial.nvim'

    -- trouble - see all code troubles at one place
    use 'folke/trouble.nvim'

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

    -- dirdiff - to ease diff directory recursively
    use 'cossonleo/dirdiff.nvim'

    use {
        'ggandor/leap.nvim',
    }

    use({
        "epwalsh/obsidian.nvim",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                dir = "/mnt/c/tmp_dir/obsidian_mywave",
            })
        end,
    })

    -- automatically set up configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
