" Override system filetype.vim
if exists('g:did_load_commands')
  finish
endif
let g:did_load_commands = 1

"
" Format json.
"
command! -nargs=0 FormatJSON normal! '<C-U>:%!python -m json.tool'

"
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
" Pulse Line (thanks Steve Losh)
"
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

"
" Create find command.
"
if exists('g:loaded_find') || !executable('rg')
  finish
endif
let g:loaded_find = 1

" Note we extract the column as well as the file and line number
set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case\ --color=never\ --ignore-case\ --hidden
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Make the command.
command! -nargs=+ -complete=dir Find execute 'silent grep!' <q-args> | copen | redraw!
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
