vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'folke/tokyonight.nvim'

  -- file explorer
  use 'nvim-tree/nvim-tree.lua'

  -- icons 
  use 'kyazdani42/nvim-web-devicons'

  -- status line
  use 'nvim-lualine/lualine.nvim'
  use'nvim-treesitter/nvim-treesitter' -- syntax highlighting

  -- telescope dependencies
  use 'BurntSushi/ripgrep'
  use 'sharkdp/fd'

  use ({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
  use { -- fuzzy finder over list
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- html tag autocompletion
  use 'mattn/emmet-vim'

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- managing & installing lsp servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/nvim-lsp-installer'

  -- configuring lsp servers
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use({ 'glepnir/lspsaga.nvim', branch = 'main' })
  use 'jose-elias-alvarez/typescript.nvim'
  use 'onsails/lspkind.nvim'

  -- lua functions that many plugins use
  use 'nvim-lua/plenary.nvim'

  -- tmux and split window navigation
  use 'christoomey/vim-tmux-navigator'

  -- maximizes and restores current window
  use 'szw/vim-maximizer'

  -- essential plugins
  use 'tpope/vim-surround'
  use 'vim-scripts/ReplaceWithRegister'

  -- commenting with gc
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- vimwiki, notetaking...
  use 'vimwiki/vimwiki'
  -- use "oberblastmeister/neuron.nvim"

  use {
    "nvim-neorg/neorg",
    tag = "*",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


