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
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" }}}

" Sudo write (,W) {{{
noremap <leader>w :w<CR>
" }}}

" Remap :W to :w {{{
command! W w
" }}}

" Buffer navigation (,,) (gb) (gB) (,ls) {{{
map <Leader><Leader> <C-^>

" Clear last search (,qs) {{{
map <silent> <leader>qs <Esc>:noh<CR>
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
