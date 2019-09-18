" Speed up transition from modes
" Eliminating delays on ESC in vim and zsh
if exists('g:loaded_fast_escape') || has('gui_running')
  finish
endif
let g:loaded_fast_escape = 1

augroup fast_escape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END
