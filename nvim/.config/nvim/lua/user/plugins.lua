local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Common Utilities
  use 'nvim-lua/plenary.nvim'

  -- Theme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Floating window - used for lazy git
  use 'voldikss/vim-floaterm'

  -- Status line
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'onsails/lspkind-nvim'

  -- Language Server Protocol
  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-colors.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Auto pairs and tags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Buffer line
  use 'akinsho/nvim-bufferline.lua'

  -- Show colors in code
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- AI Assistant - Claude Code
  use {
    'greggh/claude-code.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('claude-code').setup()
    end
  }
end)
