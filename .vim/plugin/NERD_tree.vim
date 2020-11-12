let g:NERDTreeWinPos = "left"
let NERDTreeHighlightCursorline = 0

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeMapMenu='M'
let g:NERDTreeRespectWildIgnore = 1

" Use the 'wildignore' and 'suffixes' settings for filtering out files.
function! s:FileGlobToRegexp( glob )
    " The matching is done against the sole file / directory name.
    if a:glob =~# '^\*\.'
        return '\.' . a:glob[2:] . '$'
    else
        return '^' . a:glob . '$'
    endif
endfunction
function! s:SuffixToRegexp( suffix )
    return escape(v:val, '.~') . "$"
endfunction
let g:NERDTreeIgnore =
\   map(split(&wildignore, ','), 's:FileGlobToRegexp(v:val)') +
\   map(split(&suffixes, ','), 's:SuffixToRegexp(v:val)')
delfunction s:SuffixToRegexp
delfunction s:FileGlobToRegexp


" Disable live update
let g:NERDTreeGitStatusUpdateOnCursorHold = 0
let g:NERDTreeGitStatusUpdateOnWrite = 0
