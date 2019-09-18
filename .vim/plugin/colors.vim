" colors.vim: Overrides themes.
if exists('g:loaded_colors')
  finish
endif
let g:loaded_colors = 1

augroup colors
  autocmd!
  " Transparent background {{{
  autocmd ColorScheme *
        \ highlight Normal guibg=NONE ctermbg=NONE |
        \ highlight NonText guibg=NONE ctermbg=NONE
  " }}}
  " Color (see listchars) {{{
  autocmd ColorScheme *
        \ highlight NonText ctermfg=10 ctermbg=8 guifg=#000000 guibg=#000000 |
        \ highlight SpecialKey term=NONE cterm=NONE
  " }}}
augroup END
