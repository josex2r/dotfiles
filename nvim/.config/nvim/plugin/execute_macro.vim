" This allows you to visually select a section and then hit @ to run a macro
" on all lines. Only lines which match will change. Without this script the
" macro would stop at lines which don’t match the macro.
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
