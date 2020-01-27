" Settings -------------------------------------------------------------

" Preamble {{{

" Syntax highlighting {{{
if !exists('g:syntax_on')
  syntax enable
endif
set t_Co=256 " Terminal colors.
set encoding=utf-8 nobomb " BOM often causes trouble
scriptencoding utf-8
" }}}

" Mapleader {{{
let mapleader="\<Space>"
" }}}

" Local directories {{{
" if !has('nvim')
  set backupdir=~/.vim/backups
  set directory=~/.vim/swaps
  set undodir=~/.vim/undo
" endif
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set diffopt+=internal " Use the internal diff library
set diffopt+=indent-heuristic " Use the indent heuristic
set diffopt+=algorithm:patience " Use patience diff algorithm
" set expandtab " Expand tabs to spaces
set nofoldenable " Dont enable folding
" set foldenable " Dont enable folding
set foldcolumn=0 " Column to show folds
set foldlevel=0 " Close all folds by default
set foldlevelstart=-1 " Start fold level
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=10 " Set max fold nesting level
set foldclose="" Close as you walk out a fold
" set nofoldenable " Disable fold.
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (statusline takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set number " Enable line numbers
set omnifunc=syntaxcomplete#Complete " Set omni-completion method
" set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=6 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=1 " Show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set browsedir=buffer " browse files in same dir as open file
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
" set wildignore+=*/.git/logs/*,*/.git/refs/*
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/smarty/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*,*/recs/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest,full " Complete only until point of ambiguity
set wildignorecase
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
set shiftwidth=4 " Fix mixed-indent warning
set tags+=.tags/tags " Set tags folder.
set infercase " Improve ignorecase
set synmaxcol=400 " Enable syntax highlight on the first 200 cols
set breakindent " Preserve indentation on wrap toggle
set showbreak=⤷ " String to use on breakindent
" set autoread " Force check disk file
set timeout " enable timeout for mapping
set ttimeout " enable timeout for key codes
set ttimeoutlen=10 " unnoticeable small value
set cmdheight=1 " avoid hit-enter prompts
" set clipboard=autoselect
set listchars=tab:\¦\ ,trail:·,eol:¬,nbsp:_
set fillchars=fold:-
set relativenumber " Use relative line numbers. Current line is still in status bar.
set conceallevel=0 " No conceal
set timeoutlen=1000

" Neovim only settings.
if has('nvim')
  set shada='9999,s512,n~/.config/nvim/shada " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
endif

" Vim only settings.
if !has('nvim')
  set viminfo='9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
  set esckeys " Allow cursor keys in insert mode
  set ttymouse=xterm " Set mouse type to xterm
endif
" }}}

" }}}

" Load config {{{
runtime! config/*.vim
" }}}

" Credit joshdick
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

" Color schemes {{{
" let g:solarized_termtrans = 1
" colorscheme solarized

colorscheme one
set background=dark
call one#highlight('CursorLine', '', '343942', 'none')

" Enable background transparency (terminal defaults)
hi Normal guibg=NONE ctermbg=NONE
" }}}
