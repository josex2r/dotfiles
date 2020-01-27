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

" Text {{{
Plug 'inkarkat/vim-SpellCheck' " Populate spell check to quickfix.
Plug 'inkarkat/vim-ingo-library' " Dependency for vim-SpellCheck.
" }}}

" Search {{{
" Plug 'wsdjeg/FlyGrep.vim'
" }}}

" Syntax {{{
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
" Plug 'chrisbra/vim-zsh', { 'for': 'zsh' }
Plug 'Quramy/vim-js-pretty-template' " JS template strings format
Plug 'ap/vim-css-color' " Hex colors highlight
" }}}

" File tree {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
" Plug 'Xuyuanp/nerdtree-git-plugin' " Disabled due https://github.com/Xuyuanp/nerdtree-git-plugin/issues/76
" }}}

" Comments {{{
Plug 'tpope/vim-commentary'
" }}}

" Misc {{{
Plug 'tpope/vim-repeat' " Repeat everything
Plug 'tpope/vim-abolish' " Camelcase, snakecase, mixedcase coercion
Plug 'tpope/vim-sleuth' " Autodetect indentation
Plug 'tpope/vim-unimpaired' " Pair aliases and toggling options
Plug 'fcpg/vim-altscreen' " Clean terminal on vim shell commands
Plug 'mjbrownie/swapit' " <c-a> increments
Plug 'xtal8/traces.vim' " Search highlight as typing
Plug 'hauleth/sad.vim' " Change and repeat
Plug 'justinmk/vim-sneak' " The missing motion for Vim
Plug 'kopischke/vim-fetch' " Handle line number on filename
Plug 'vim-scripts/Spiffy-Foldtext' " Pretty folds
Plug 'tmhedberg/matchit' " Extend % command
Plug 'junegunn/vim-easy-align' " Align text
Plug 'tpope/vim-dispatch' " Async shell commands
Plug 'Olical/vim-enmasse' " Edit every line in a quickfix list at the same time

" Plug 'majutsushi/tagbar' " Easy way to browse the tags of the current file
" Plug 'scrooloose/nerdcommenter' " Intensely orgasmic commenting, changes comments formatting
" Plug 'godlygeek/tabular' " Run ':Tab' to align text as a table
" Plug 'tpope/vim-surround' " add/delete/replace surroundings of a sandwiched textobject
" Plug 'justinmk/vim-sneak' " The missing motion for Vim
" Plug 'junegunn/vim-peekaboo' " Inspect the contents of the registers
" }}}

" Git {{{
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive' " Git commands
Plug 'airblade/vim-gitgutter' " Git gutter marks
" }}}

" Spaces / Tabs {{{
Plug 'editorconfig/editorconfig-vim', { 'do': 'brew install editorconfig' }
Plug 'ntpeters/vim-better-whitespace'
" }}}

" LSP {{{
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
" }}}

" Autocompletion {{{
" if v:version > 800 && has('python3')
"   Plug 'Shougo/deoplete.nvim', { 'do': 'pip3 install neovim' } " Surround wrappers
"   Plug 'roxma/nvim-yarp' " deoplete dependency.
"   Plug 'roxma/vim-hug-neovim-rpc' " deoplete dependency
"   Plug 'Shougo/neco-syntax' " syntax source
"   Plug 'Shougo/neco-vim' " vim source
"   Plug 'ujihisa/neco-look' " words source
"   Plug 'wellle/tmux-complete.vim' " tmux panel source
"   Plug 'fszymanski/deoplete-emoji' " emoji source
"   Plug 'Shougo/context_filetype.vim' " code fences source
" endif
Plug 'Shougo/neco-syntax' " vim syntax source
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-sources'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" }}}

" Parens, Brackets, etc... {{{
" Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich' " Surround wrappers
" }}}

" Snippets {{{
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'jjasghar/snipmate-snippets'
" }}}

" Linter {{{
Plug 'w0rp/ale'
" }}}

" Navigation {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-smooth-scroll'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'do': 'brew install ripgrep && brew install bat' }
if v:version >= 800 && has('python3')
  if !has('nvim')
    Plug 'roxma/nvim-yarp' " denite dependency.
    Plug 'roxma/vim-hug-neovim-rpc' " denite dependency
  endif
  " Plug 'Shougo/denite.nvim', { 'do': 'pip3 install pynvim' }
endif
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
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' } " Compilation
" }}}
"
" Language Tools {{{
Plug 'moll/vim-node' " Node
Plug 'racer-rust/vim-racer' " Rust
Plug 'mattn/emmet-vim' " HTML shorcuts (crtl+y,)
" Plug 'Quramy/tsuquyomi' " Typescript server
" let g:tsuquyomi_disable_default_mappings = 1
Plug 'sukima/vim-javascript-imports'
Plug 'sukima/vim-ember-imports' " Ember Imports
if has('nvim')
  Plug 'meain/vim-package-info', { 'do': 'npm install -g neovim && npm install' } " View the latest version of packages
endif
" }}}

call plug#end()
