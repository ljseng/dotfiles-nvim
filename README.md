# dotfiles-nvim

- Load no plugins if running as embedded neovim mode for vscode
- Plugin specific configuration is organized into `lua/plugins/*`

## Plugin and external dependency

| Plugin                                                                                  | Purpose                                  | Dependency |
| --------------------------------------------------------------------------------------- | ---------------------------------------- | ---------- |
| `wbthomason/packer.nvim`                                                                | Plugin manager                           | NA         |
| `sainnhe/everforest`                                                                    | Theming                                  | NA         |
| `nvim-tree/nvim-tree.lua`                                                               | File explorer with git support           | NA         |
| `rcarriga/nvim-notify`                                                                  | Notification bubble                      | NA         |
| `nvim-lualine/lualine.nvim`                                                             | Must better statusline                   | NA         |
| `romgrk/barbar.nvim`                                                                    | Much better way to handle buffer         | NA         |
| `nvim-telescope/telescope.nvim`                                                         | Very powerful fuzzy find files           | `ripgrep`  |
| `nvim-treesitter/nvim-treesitter`                                                       | For accurate syntax highlighting         | NA         |
| `williamboman/mason.nvim`, `williamboman/mason-lspconfig.nvim`, `neovim/nvim-lspconfig` | Language Server Protocol                 | `phpactor` |
| `hrsh7th/cmp-nvim-lsp`, `hrsh7th/nvim-cmp`                                              | Autocomplete engine                      | NA         |
| `stevearc/aerial.nvim`                                                                  | To get code context/outline              | NA         |
| `akinsho/toggleterm.nvim`                                                               | For better terminal experience           | `lazygit`  |
| `lewis6991/gitsigns.nvim`                                                               | Preview and manage git changes in buffer | NA         |
| `rafamadriz/friendly-snippets`                                                          | Snippet to write code faster             | NA         |
| `folke/trouble.nvim`                                                                    | See all LSP items in one place           | NA         |
