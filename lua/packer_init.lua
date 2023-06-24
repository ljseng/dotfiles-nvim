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

    -- toggleterm
    use 'akinsho/toggleterm.nvim'

    -- dirdiff - to ease diff directory recursively
    use 'cossonleo/dirdiff.nvim'

    -- chatgpt
    use {
        'jackMort/ChatGPT.nvim',
        config = function() require('chatgpt').setup({
            -- TODO: move into its own configuration file. for unknown reason, must be put here to get it to work
            popup_input = {
                submit = "<CR>",        -- when prompting, in insert mode, <Enter> to send the prompt. <C-Enter> to insert new line (multiline prompt)
                submit_n = "<Enter>",   -- when prompting, in normal mode, <Enter> to send the prompt.
            },
        }) end,
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    }

    -- automatically set up configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
