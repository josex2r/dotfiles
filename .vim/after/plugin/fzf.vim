if !exists('g:loaded_fzf')
  finish
endif

" Config.
let g:fzf_layout = { 'up': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mappings.
nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>p :Buffer<CR>
nnoremap <C-g> :Rg<Cr>

" Commands.
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
