require('packer').startup(function(use)
  -- This plugin will eventually be merged into Neovim core via this PR:
  -- https://github.com/neovim/neovim/pull/15436
  use "lewis6991/impatient.nvim"

  -- Add you plugins here like:
  use "wbthomason/packer.nvim"

   -- lua utilities
  use "nvim-lua/plenary.nvim"

  -- Theme
  use "navarasu/onedark.nvim"
  use "kyazdani42/nvim-web-devicons"
  -- use { "yamatsum/nvim-nonicons", requires = { "kyazdani42/nvim-web-devicons" } }
  use "glepnir/dashboard-nvim" -- Init NeoVim screen
  use "norcalli/nvim-colorizer.lua" -- Colorize hex colors
  use "Xuyuanp/scrollbar.nvim"

  -- Navigation
  use "christoomey/vim-tmux-navigator" -- Move cursor between panes
  use "nvim-telescope/telescope.nvim" -- Fuzzy finder
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } -- Use FZF algorithm
  use "fannheyward/telescope-coc.nvim" -- Coc sources for telescope
  use "folke/which-key.nvim" -- Displays a popup with possible key bindings of the command you started typing
  use { "phaazon/hop.nvim", as = "hop" } -- Jump anywhere in a document with as few keystrokes as possible
  use "nacro90/numb.nvim" -- Peeks lines of the buffer in non-obtrusive way.
  use "ggandor/lightspeed.nvim" -- Use "s <char>" to move cursor
  use "andymass/vim-matchup" -- Navigate, and operate on sets of matching text

  -- Statusbar
  use { "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }

  -- Syntax
  use "joukevandermaas/vim-ember-hbs"
  use "Quramy/vim-js-pretty-template"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- fix comments when multiple langs exists on same file
  use "windwp/nvim-ts-autotag" -- Close HTML tags
  use "p00f/nvim-ts-rainbow" -- colorize brackets

  -- Language Tools
  use "mattn/emmet-vim" -- HTML shorcuts (crtl+y,)
  use "sukima/vim-javascript-imports"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "onsails/lspkind-nvim"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
    }
  }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "github/copilot.vim"

  -- Git
  use "tpope/vim-fugitive" -- Git commands
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use "sindrets/diffview.nvim"

  -- Misc
  use "rafamadriz/friendly-snippets"
  use "editorconfig/editorconfig-vim"
  use "tpope/vim-repeat" -- Repeat everything
  use "tpope/vim-sleuth" -- Autodetect indentation
  use "fcpg/vim-altscreen" -- Clean terminal on vim shell commands
  use "xtal8/traces.vim" -- Search highlight as typing
  use "junegunn/vim-easy-align" -- Align text
  use { "windwp/nvim-spectre", requires = { "nvim-lua/plenary.nvim" } } -- A search panel for neovim.

  -- Parens, Brackets, etc...
  use "tpope/vim-commentary" -- comments using "gcc"
  use "tpope/vim-surround" -- add/delete/replace surroundings of a sandwiched textobject
  use "kshenoy/vim-signature" -- Show marks

end)
