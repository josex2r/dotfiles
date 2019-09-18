" vim:fdm=marker

" Settings -------------------------------------------------------------

" Preamble {{{

" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
colorscheme solarized
" }}}

" Mapleader {{{
let mapleader="\<Space>"
" }}}

" Local directories {{{
if !has('nvim')
  set backupdir=~/.vim/backups
  set directory=~/.vim/swaps
  set undodir=~/.vim/undo
endif
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
if !has('nvim')
  set esckeys " Allow cursor keys in insert mode
  set ttymouse=xterm " Set mouse type to xterm
endif
set expandtab " Expand tabs to spaces
set foldcolumn=1 " Column to show folds
set nofoldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set foldlevelstart=99
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
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set omnifunc=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set synmaxcol=200 "Maximum column in which to search for syntax items
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set tags+=.tags/tags " Set tags folder.
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
if !has('nvim')
  set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
endif
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" }}}


" Configuration -------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
" Eliminating delays on ESC in vim and zsh
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" General {{{
augroup general_config
  autocmd!

  " Jump words {{{
  " How to get the first char? Use CRTL+V and press the key in command mode
  " How to get the second char? Use CRTL+K and press the key in command mode
  " <Esc> means escape char (<Esc>b === ^[b)
  cnoremap <Esc>b <S-Left>
  cnoremap <Esc>f <S-Right>
  " }}}

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
  " }}}

  " Copy & paste {{{
  " Make y and p copy/paste to system clipboard
  set clipboard=unnamed
  " Normal keyboard copy/paste bindings
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
  " }}}

  " Sudo write (,W) {{{
  noremap <leader>w :w<CR>
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Get output of shell commands {{{
  command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
  " }}}

  " Remap :W to :w {{{
  command! W w
  " }}}

  " Better mark jumping (line + col) {{{
  nnoremap ' `
  " }}}

  " Hard to type things {{{
  iabbrev >> →
  iabbrev << ←
  iabbrev ^^ ↑
  iabbrev VV ↓
  iabbrev aa λ
  " }}}

  " Toggle show tabs and trailing spaces (,c) {{{
  set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
  set fcs=fold:-
  " nnoremap <silent> <leader>c :set nolist!<CR>
  nnoremap <silent> <leader>c zA<CR>
  " }}}

  " Clear last search (,qs) {{{
  map <silent> <leader>qs <Esc>:noh<CR>
  " map <silent> <leader>qs <Esc>:let @/ = ""<CR>
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  " }}}

  " Paste toggle (,p) {{{
  "set pastetoggle=<leader>p
  "map <leader>p :set invpaste paste?<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  "nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}

  " Relative numbers {{{
  " set relativenumber " Use relative line numbers. Current line is still in status bar.
  " au BufReadPost,BufNewFile * set relativenumber
  " }}}

  " Close tab and move buffer to new split pane
  " Used after creating new tab with "<C-W>T"
  " nnoremap <C-W>t mNZZ<C-W>`N
augroup END
" }}}

" NERD Commenter {{{
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
" }}}

" NERD Tree {{{
augroup nerd_tree
  autocmd!
" autocmd VimEnter * NERDTreeToggle

  map <leader>n :NERDTreeToggle<CR>
  map <leader>t :NERDTreeFind<CR>
augroup END
" }}}

" Buffers {{{
augroup buffer_control
  autocmd!

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <Leader><Leader> <C-^>
  map <Leader>ls :buffers<CR>
  map <leader>bn :bnext<CR>
  map <leader>bp :bprev<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}
  
  " Open empty buffer {{{
  map <leader>bt :enew<CR>
  " }}}

  " Close current buffer and lint window {{{
  map <leader>bd :lclose<bar>b#<bar>bd #<CR>
  " }}}

  " Close all buffers {{{
  map <leader>bD :bufdo bd<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

  " Quickfix window (,qq) (,qo) (,qj) (,qk) {{{
  map <leader>qq :cclose<CR>
  map <leader>qo :copen<CR>
  map <leader>qj :cnext<CR>
  map <leader>qk :cprev<CR>
  map <leader>qc :cc<CR>
  " }}}

 " Location list window (,qq) (,qo) (,qj) (,qk) {{{
  map <leader>lq :lclose<CR>
  map <leader>lo :lopen<CR>
  map <leader>lj :lnext<CR>
  map <leader>lk :lprev<CR>
  map <leader>ll :ll<CR>
  " }}}
augroup END
" }}}

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}

" repeat {{{
augroup repeat_config
  autocmd!
  silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
augroup END
" }}}

" Highlight Interesting Words {{{
augroup highlight_interesting_word
  autocmd!
  " This mini-plugin provides a few mappings for highlighting words temporarily.
  "
  " Sometimes you're looking at a hairy piece of code and would like a certain
  " word or two to stand out temporarily.  You can search for it, but that only
  " gives you one color of highlighting.  Now you can use <leader>N where N is
  " a number from 1-6 to highlight the current word in a specific color.
  function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
  endfunction " }}}

  " Mappings {{{
  nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
  nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
  nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
  nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
  nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
  nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
  " }}}

  " Default Highlights {{{
  hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
  hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
  hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
  hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
  hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
  hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
  hi Normal ctermbg=none
  " }}}
augroup END
" }}}

" Word Processor Mode {{{
augroup word_processor_mode
  autocmd!

  function! WordProcessorMode() " {{{
    setlocal formatoptions=t1
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=es_ES
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    " Goyo 100
  endfunction " }}}
  com! WP call WordProcessorMode()
augroup END
" }}}

" Restore Cursor Position {{{
augroup restore_cursor
  autocmd!

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}


" Custom commands ------------------------------------------------------

augroup custom_commands
  autocmd!

  " Format json.
  command! -nargs=0 FormatJSON execute "%!python -m json.tool"

  " Copy current file path.
  command! -nargs=0 CopyPath execute "let @+ = expand('%')"
augroup END

" Filetypes -------------------------------------------------------------

" C {{{
augroup filetype_c
  autocmd!

  " Highlight Custom C Types {{{
  autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
  autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
  autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
  autocmd BufRead,BufNewFile *.[ch] endif
  " }}}
augroup END
" }}}

" Clojure {{{
augroup filetype_clojure
  autocmd!
  let g:vimclojure#ParenRainbow = 1 " Enable rainbow parens
  let g:vimclojure#DynamicHighlighting = 1 " Dynamic highlighting
  let g:vimclojure#FuzzyIndent = 1 " Names beginning in 'def' or 'with' to be indented as if they were included in the 'lispwords' option
augroup END
" }}}

" Coffee {{{
augroup filetype_coffee
  autocmd!
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable ft=coffee syntax=coffee
augroup END
" }}}

" EJS {{{
augroup filetype_cwejscoffee
  autocmd!
  au BufNewFile,BufReadPost *.ejs setl foldmethod=indent nofoldenable ft=javascript syntax=javascript
augroup END
" }}}

" Fish {{{
augroup filetype_fish
  autocmd!
  au BufRead,BufNewFile *.fish set ft=fish
augroup END
" }}}

" Handlebars {{{
augroup filetype_hbs
  autocmd!
  au BufRead,BufNewFile *.hbs,*.handlebars,*.hbs.erb,*.handlebars.erb setl ft=mustache syntax=mustache
augroup END
" }}}

" Jade {{{
augroup filetype_jade
  autocmd!
  au BufRead,BufNewFile *.jade set ft=jade syntax=jade
augroup END
" }}}

" JavaScript {{{
augroup filetype_javascript
  autocmd!
  " Load ES6 snippets
  au FileType js UltiSnipsAddFiletypes javascript-es6

  " General conceal settings. Will keep things concealed
  set conceallevel=0
  "set concealcursor=nc

  " even when your cursor is on top of them.
  let g:javascript_conceal_function       = "ƒ"
  let g:javascript_conceal_null           = "ø"
  let g:javascript_conceal_this           = "@"
  let g:javascript_conceal_return         = "⇚"
  let g:javascript_conceal_undefined      = "¿"
  let g:javascript_conceal_NaN            = "ℕ"
  let g:javascript_conceal_prototype      = "¶"
  let g:javascript_conceal_static         = "•"
  let g:javascript_conceal_super          = "Ω"
  let g:javascript_conceal_arrow_function = "⇒"
augroup END
" }}}

" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
  autocmd!
  let g:vim_markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh', 'js=javascript', 'handlebars', 'hbs=handlebars', 'ini=dosini']
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_new_list_item_indent = 2
augroup END
" }}}

" Nu {{{
augroup filetype_nu
  autocmd!
  au BufNewFile,BufRead *.nu,*.nujson,Nukefile setf nu
augroup END
" }}}

" Ruby {{{
augroup filetype_ruby
  autocmd!

  au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

  " Ruby.vim {{{
  let ruby_operators = 1
  let ruby_space_errors = 1
  let ruby_fold = 1
  " }}}
augroup END
" }}}

" }}}
" XML {{{
augroup filetype_xml
  autocmd!
  " au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END
" }}}

" ZSH {{{
augroup filetype_zsh
  autocmd!
  au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
augroup END
" }}}


" Plugin Configuration -------------------------------------------------------------

" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

" SmoothScroll {{{
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }}}

" Ale.vim {{{
augroup ale_config
  autocmd!
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'
  let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'markdown': ['remark-lint', 'alex'],
    \   'handlebars': ['ember-template-lint'],
    \   'bash': ['shellcheck'],
  \}
augroup END
" }}}

" commetary.vim {{{
augroup commentary_config
  autocmd!
  autocmd FileType apache setlocal commentstring=#\ %s
augroup END
" }}}

" FZF {{{
augroup fzf_config
  autocmd!
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }

  function! FZFPreview() " {{{
    call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))
  endfunction " }}}

  let g:fzf_layout = { 'up': '~40%' }
  " let g:fzf_layout = { 'down': '~40%' }
  let g:fzf_files_options =
   \ '--preview "head -'.&lines.' {}"'

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
    \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \   <bang>0)

  let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
  let g:ctrlp_clear_cache_on_exit = 1

  noremap <silent> <D-> :Files<CR>
  noremap <silent> <c-p> :Files<CR>
  noremap <leader>p :Buffer<CR>
  nnoremap <C-g> :Rg<Cr>
augroup END
" }}}

" tagbar {{{
augroup tagbar_config
  autocmd!
  nmap <F8> :TagbarToggle<CR>
augroup END
" }}}

" mustache {{{
augroup mustache_config
  autocmd!
  let g:mustache_abbreviations = 1
augroup END
" }}}

" ack {{{
augroup ack_config
  autocmd!
  let g:ackprg = 'ag --vimgrep'
augroup END
" }}}

" Neosnippet {{{
augroup neocomplete_config
  autocmd!
  let g:neosnippet#enable_completed_snippet = 1
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory=['~/.vim/plugged/vim-snippets/snippets', '~/.vim/my-snippets']
  " Plugin key-mappings.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  " if has('conceal')
    " set conceallevel=2 concealcursor=niv
  " endif
augroup END
" }}}

" ternjs {{{
augroup ternjs_config
  autocmd!
  " Whether to include the types of the completions in the result data. Default: 0
  let g:deoplete#sources#ternjs#types = 1

  " Whether to include the distance (in scopes for variables, in prototypes for 
  " properties) between the completions and the origin position in the result 
  " data. Default: 0
  let g:deoplete#sources#ternjs#depths = 1

  " Whether to include documentation strings (if found) in the result data.
  " Default: 0
  let g:deoplete#sources#ternjs#docs = 1

  " When on, only completions that match the current word at the given point will
  " be returned. Turn this off to get all results, so that you can filter on the 
  " client side. Default: 1
  let g:deoplete#sources#ternjs#filter = 0

  " Whether to use a case-insensitive compare between the current word and 
  " potential completions. Default 0
  let g:deoplete#sources#ternjs#case_insensitive = 1

  " When completing a property and no completions are found, Tern will use some 
  " heuristics to try and return some properties anyway. Set this to 0 to 
  " turn that off. Default: 1
  let g:deoplete#sources#ternjs#guess = 0

  " Determines whether the result set will be sorted. Default: 1
  let g:deoplete#sources#ternjs#sort = 0

  " When disabled, only the text before the given position is considered part of 
  " the word. When enabled (the default), the whole variable name that the cursor
  " is on will be included. Default: 1
  let g:deoplete#sources#ternjs#expand_word_forward = 0

  " Whether to ignore the properties of Object.prototype unless they have been 
  " spelled out by at least two characters. Default: 1
  let g:deoplete#sources#ternjs#omit_object_prototype = 0

  " Whether to include JavaScript keywords when completing something that is not 
  " a property. Default: 0
  let g:deoplete#sources#ternjs#include_keywords = 1

  " If completions should be returned when inside a literal. Default: 1
  let g:deoplete#sources#ternjs#in_literal = 0


  "Add extra filetypes
  let g:deoplete#sources#ternjs#filetypes = [
        \ 'jsx',
        \ 'javascript.jsx',
        \ 'vue',
        \ '...'
        \ ]

  " Use tern_for_vim.
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
augroup END
" }}}

" CSS3 {{{
augroup VimCSS3Syntax
  autocmd!

  " Support `-` in css property names
  autocmd FileType css setlocal iskeyword+=-
augroup END
" }}}

" JSX {{{
augroup jsx_config
  autocmd!
  let g:jsx_ext_required = 0 " Works on files other than .jsx
augroup END
" }}}

" vim-js-pretty-template {{{
" augroup vim_js_pretty_template_config
"   autocmd!
"   autocmd FileType javascript.jsx JsPreTmpl
"   autocmd FileType javascript JsPreTmpl
"   autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only. Please see #1 for details.
" augroup END
" }}}

" Custom -------------------------------------------------------------

" This allows you to visually select a section and then hit @ to run a macro
" on all lines. Only lines which match will change. Without this script the
" macro would stop at lines which don’t match the macro.
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Swap Cursors on mode change {{{
" if exists('$TMUX')
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif
" }}}

" Plugins -------------------------------------------------------------

" Load plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter' " Shows a git diff in the 'gutter' (sign column)
Plug 'majutsushi/tagbar' " Easy way to browse the tags of the current file
Plug 'bling/vim-airline' " Lean & mean status/tabline for vim that's light as air.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter' " Intensely orgasmic commenting, changes comments formatting
Plug 'scrooloose/nerdtree' " Display directory tree
Plug 'Xuyuanp/nerdtree-git-plugin' " Enables icons to display the git status of a file
Plug 'tpope/vim-commentary' " Esasy comment shortcuts
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'godlygeek/tabular' " Run ':Tab' to align text as a table
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround' " add/delete/replace surroundings of a sandwiched textobject
Plug 'editorconfig/editorconfig-vim' " EditorConfig plugin
Plug 'justinmk/vim-sneak' " The missing motion for Vim
Plug 'junegunn/vim-peekaboo' " Inspect the contents of the registers
Plug 'terryma/vim-smooth-scroll' " Make scrolling in Vim more pleasant

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Autocomplete
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
Plug 'Shougo/echodoc' " Displays function signatures from completions in the command line.
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/deoplete-typescript'
" Language packs
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim

" Plug 'jiangmiao/auto-pairs' " Autoclose chars
Plug 'terryma/vim-multiple-cursors' " crtl+n
Plug 'mattn/emmet-vim' " HTML shorcuts (crtl+y,)
Plug 'honza/vim-snippets'
Plug 'Olical/vim-enmasse' " Edit every line in a quickfix list at the same time
Plug 'mileszs/ack.vim' " Vim plugin for the Perl module / CLI script 'ack'
Plug 'w0rp/ale' " Asynchronous Lint Engine
" Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
Plug 'sukima/vim-javascript-imports'
Plug 'sukima/vim-ember-imports' " Ember RFC module unification
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
" Plug 'Quramy/vim-js-pretty-template' " Highlight ES6 template literals
Plug 'ap/vim-css-color' " Colorize hex codes

call plug#end()

" Deoplete {{{
augroup deoplete_config
  autocmd!
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_profile = 1
  call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')
  call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ 'profile': v:true,
  \ })
augroup END
" }}}

" }}}

" call jspretmpl#register_tag('gql', 'graphql')
" call jspretmpl#register_tag('graphql', 'graphql')
" call jspretmpl#register_tag('html', 'html')
" call jspretmpl#addRule('html', 'html`')
" call jspretmpl#addRule('html', 'html `')
" Use sass highlighting for `styled.span` / `styled.div` / etc
" call jspretmpl#register_tag('\v(styled\.\w+)', 'scss')
