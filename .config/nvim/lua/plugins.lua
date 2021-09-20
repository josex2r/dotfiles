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

  -- Navigation
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-telescope/telescope.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'glepnir/dashboard-nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/which-key.nvim' -- Displays a popup with possible key bindings of the command you started typing

  -- Statusbar
  use 'akinsho/bufferline.nvim'
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true } }

  -- Syntax
  use 'joukevandermaas/vim-ember-hbs'
  use 'Quramy/vim-js-pretty-template'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Language Tools
  use 'mattn/emmet-vim' -- HTML shorcuts (crtl+y,)
  use 'sukima/vim-javascript-imports'
  use { 'sukima/vim-ember-imports', after = 'vim-javascript-imports' } -- Ember Imports

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'neoclide/coc-neco'
  use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }

  -- Git
  use 'tpope/vim-fugitive' -- Git commands
  use 'airblade/vim-gitgutter' -- Git gutter marks

  -- Misc
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
