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
" Plug 'altercation/vim-colors-solarized'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
" }}}

" Statusbar {{{
Plug 'itchyny/lightline.vim'
" Plug 'bling/vim-airline' " Lean & mean status/tabline for vim that's light as air.
" }}}

" Syntax {{{
let g:polyglot_disabled = ['md', 'markdown', 'hbs', 'handlebars']
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'Quramy/vim-js-pretty-template' " JS template strings format
Plug 'tpope/vim-markdown'
" }}}

" File tree {{{
" Plug 'tpope/vim-vinegar' " native netrw

" Plug 'lambdalisue/fern.vim' " another file tree
" Plug 'lambdalisue/fern-renderer-devicons.vim'
" Plug 'lambdalisue/fern-mapping-project-top.vim'

Plug 'mhinz/vim-startify' " start screen to select files

" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
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
Plug 'kopischke/vim-fetch' " Handle line number on filename
Plug 'tmhedberg/matchit' " Extend % command
Plug 'junegunn/vim-easy-align' " Align text
Plug 'Olical/vim-enmasse' " Edit every line in a quickfix list at the same time
" Plug 'majutsushi/tagbar' " Easy way to browse the tags of the current file
" Plug 'scrooloose/nerdcommenter' " Intensely orgasmic commenting, changes comments formatting
" Plug 'godlygeek/tabular' " Run ':Tab' to align text as a table
" Plug 'tpope/vim-surround' " add/delete/replace surroundings of a sandwiched textobject
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'master' }
" }}}

" Parens, Brackets, etc... {{{
Plug 'machakann/vim-sandwich' " Surround wrappers
" }}}

" Snippets {{{
Plug 'honza/vim-snippets'
" }}}

" Linter {{{
Plug 'w0rp/ale'
" }}}

" Navigation {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'do': 'brew install ripgrep && brew install bat' }
Plug 'antoinemadec/coc-fzf'
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
Plug 'moll/vim-node' " Node
Plug 'racer-rust/vim-racer' " Rust
Plug 'mattn/emmet-vim' " HTML shorcuts (crtl+y,)
Plug 'sukima/vim-javascript-imports'
Plug 'sukima/vim-ember-imports' " Ember Imports
" }}}

call plug#end()
