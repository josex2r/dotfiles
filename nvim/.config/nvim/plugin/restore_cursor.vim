"
" restore_cursor.vim: Restore cursor to the last known position.
"
if exists('g:loaded_restore_cursor')
  finish
endif

let g:loaded_restore_cursor = 1

augroup restore_cursor
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
