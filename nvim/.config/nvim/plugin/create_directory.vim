"
" create_directory.vim: Create directory on save.
"
" Author: Adrián González Rus <adrian.gonzalez.rus@bbva.com>
" License: Same as Vim itself
"
if exists('g:loaded_create_directory')
  finish
endif
let g:loaded_create_directory = 1

function s:MkNonExDir(file, buf) abort
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let l:dir=fnamemodify(a:file, ':h')
    if !isdirectory(l:dir)
      call mkdir(l:dir, 'p')
    endif
  endif
endfunction

augroup create_directory
    autocmd!
    au BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
