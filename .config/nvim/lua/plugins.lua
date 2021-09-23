require('packer').startup(function()
  local use = use
  -- Add you plugins here like:
  use 'wbthomason/packer.nvim'

   -- lua utilities
  use 'nvim-lua/plenary.nvim'

  -- This plugin will eventually be merged into Neovim core via this PR:
  -- https://github.com/neovim/neovim/pull/15436
  use 'lewis6991/impatient.nvim'

  -- Theme
  use 'navarasu/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Navigation
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'glepnir/dashboard-nvim'
  use 'folke/which-key.nvim' -- Displays a popup with possible key bindings of the command you started typing

  -- Statusbar
  use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

  -- Syntax
  use 'joukevandermaas/vim-ember-hbs'
  use 'Quramy/vim-js-pretty-template'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'

  -- Language Tools
  use 'mattn/emmet-vim' -- HTML shorcuts (crtl+y,)
  use 'sukima/vim-javascript-imports'

  -- LSP
  -- use 'neovim/nvim-lspconfig'
  -- use 'onsails/lspkind-nvim'
  -- -- use 'tamago324/nlsp-settings.nvim'
  -- use 'kabouzeid/nvim-lspinstall'
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   requires = {
  --     -- 'L3MON4D3/LuaSnip',
  --     -- 'saadparwaiz1/cmp_luasnip',
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-nvim-lua',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-calc',
  --     'f3fora/cmp-spell',
  --     'hrsh7th/cmp-emoji',
  --   }
  -- }
  use 'neoclide/coc-neco'
  use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }

  -- Git
  use 'tpope/vim-fugitive' -- Git commands
  use 'airblade/vim-gitgutter' -- Git gutter marks

  -- Misc
  use 'rafamadriz/friendly-snippets'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-repeat' -- Repeat everything
  use 'tpope/vim-sleuth' -- Autodetect indentation
  use 'fcpg/vim-altscreen' -- Clean terminal on vim shell commands
  use 'xtal8/traces.vim' -- Search highlight as typing
  use 'hauleth/sad.vim' -- Change and repeat
  use 'junegunn/vim-easy-align' -- Align text
  use 'Olical/vim-enmasse' -- Replace in all quickfix list

  -- Parens, Brackets, etc...
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround' -- add/delete/replace surroundings of a sandwiched textobject
  use 'kshenoy/vim-signature' -- Show marks

  end
)
