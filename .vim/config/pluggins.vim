" vim:fdm=marker

" Install Plugin Manager {{{
augroup vim_plug
  autocmd!
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
augroup END
" }}}

call plug#begin('~/.vim/plugged')

" Themes {{{
Plug 'navarasu/onedark.nvim'
" }}}

" Statusbar {{{
" Plug 'itchyny/lightline.vim'
Plug 'akinsho/bufferline.nvim'
" }}}

" Syntax {{{
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'Quramy/vim-js-pretty-template' " JS template strings format
" Plug 'tpope/vim-markdown'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" }}}

" File tree {{{
" Plug 'mhinz/vim-startify' " start screen to select files
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-web-devicons'
" }}}

" Comments {{{
Plug 'tpope/vim-commentary'
" }}}

" Misc {{{
Plug 'tpope/vim-repeat' " Repeat everything
" Plug 'tpope/vim-abolish' " Camelcase, snakecase, mixedcase coercion
Plug 'tpope/vim-sleuth' " Autodetect indentation
" Plug 'tpope/vim-unimpaired' " Pair aliases and toggling options
Plug 'fcpg/vim-altscreen' " Clean terminal on vim shell commands
Plug 'xtal8/traces.vim' " Search highlight as typing
Plug 'hauleth/sad.vim' " Change and repeat
" Plug 'justinmk/vim-sneak' " The missing motion for Vim
Plug 'junegunn/vim-easy-align' " Align text
Plug 'Olical/vim-enmasse' " Edit every line in a quickfix list at the same time
" Plug 'majutsushi/tagbar' " Easy way to browse the tags of the current file
" Plug 'scrooloose/nerdcommenter' " Intensely orgasmic commenting, changes comments formatting
" Plug 'godlygeek/tabular' " Run ':Tab' to align text as a table
" Plug 'justinmk/vim-sneak' " The missing motion for Vim
" Plug 'junegunn/vim-peekaboo' " Inspect the contents of the registers
" }}}

" Git {{{
Plug 'tpope/vim-fugitive' " Git commands
Plug 'airblade/vim-gitgutter' " Git gutter marks
" }}}

" Spaces / Tabs {{{
Plug 'editorconfig/editorconfig-vim', { 'do': 'brew install editorconfig' }
Plug 'ntpeters/vim-better-whitespace'
" }}}

" Autocompletion {{{
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" }}}

" Parens, Brackets, etc... {{{
" Plug 'machakann/vim-sandwich' " Surround wrappers
Plug 'tpope/vim-surround' " add/delete/replace surroundings of a sandwiched textobject
" }}}

" Navigation {{{
Plug 'christoomey/vim-tmux-navigator'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim', { 'do': 'brew install ripgrep && brew install bat' }
" Plug 'antoinemadec/coc-fzf'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
" }}}

" Marks {{{
Plug 'kshenoy/vim-signature' " Show marks
" }}}

" Help {{{
Plug 'chrisbra/vim_faq'
" }}}

" Debugging {{{
Plug 'tpope/vim-scriptease'
" }}}

" Markdown {{{
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' } " Compilation
" }}}
"
" Language Tools {{{
Plug 'mattn/emmet-vim' " HTML shorcuts (crtl+y,)
Plug 'sukima/vim-javascript-imports'
Plug 'sukima/vim-ember-imports' " Ember Imports
" }}}

call plug#end()
