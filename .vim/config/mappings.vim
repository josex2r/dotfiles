" Jump words {{{
" How to get the first char? Use CRTL+V and press the key in command mode
" How to get the second char? Use CRTL+K and press the key in command mode
" <Esc> means escape char (<Esc>b === ^[b)
"
" :nmap - Display normal mode maps
" :imap - Display insert mode maps
" :vmap - Display visual and select mode maps
" :smap - Display select mode maps
" :xmap - Display visual mode maps
" :cmap - Display command-line mode maps
" :omap - Display operator pending mode maps
"
" <M-*> is the 'meta' key (ALT)
nmap <M-f> <Esc>w
nmap <M-b> <Esc>b
vmap <M-f> <S-Right>
vmap <M-b> <S-Left>
imap <M-f> <S-Right>
imap <M-b> <S-Left>
cmap <M-f> <Esc>w
cmap <M-b> <Esc>b
omap <M-f> <Esc>w
omap <M-b> <Esc>b
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>
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
" }}}

" Clear last search (,qs) {{{
map <silent> <leader>qs <Esc>:noh<CR>
" }}}

" Search and replace word under cursor (,*) {{{
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
" }}}

" Join lines and restore cursor location (J) {{{
nnoremap J mjJ`j
" }}}

" Fix page up and down {{{
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
" }}}

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

" map Mac OS X Terminal.app default Home and End
map <C-A> <Home>
imap <C-A> <Home>
vmap <C-A> <Home>
cmap <C-A> <Home>
map <C-E> <End>
imap <C-E> <End>
vmap <C-E> <End>
cmap <C-E> <End>
