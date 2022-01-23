vim.cmd([[

" Copy current file full path.
"
command! -nargs=0 CopyFullPath execute "let @+ = expand('%:p')"

"
" Copy current file path.
"
command! -nargs=0 CopyPath execute "let @+ = expand('%')"

"
" Copy current file path.
"
command! -nargs=0 CopyName execute "let @+ = expand('%:t')"

"
" Word processor mode
"
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

command! -nargs=0 WP call s:WordProcessorMode()

" Note we extract the column as well as the file and line number
" set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case\ --color=never\ --ignore-case\ --hidden --exclude=shellescape(&wildignore)
set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Make the command.
command! -nargs=+ -complete=dir Find execute 'silent grep!' <q-args> | copen | redraw!
]])
