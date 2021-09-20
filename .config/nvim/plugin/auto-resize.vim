" auto_resize.vim: Automatically equalize splits when vim is resized.
if exists('g:loaded_auto_resize')
  finish
endif
let g:loaded_auto_resize = 1

augroup auto_resize
    autocmd!
    autocmd VimResized * wincmd =
augroup END
