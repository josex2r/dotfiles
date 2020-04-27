if !exists(':Fern')
  finish
endif

nnoremap <leader>t :Fern . -drawer -reveal=%<CR>
nnoremap <leader>n :Fern -toggle<CR>

function! s:init_fern() abort
  " NEEDS 'christoomey/vim-tmux-navigator'
  " Fix left navigation
  nmap <buffer><nowait> <C-h> :TmuxNavigateLeft<cr>
  " Fix right navigation
  nmap <buffer><nowait> <C-l> :TmuxNavigateRight<cr>
  " Fix down navigation
  nmap <buffer><nowait> <C-j> :TmuxNavigateDown<cr>
  " Fix up navigation
  nmap <buffer><nowait> <C-k> :TmuxNavigateUp<cr>
  " Backspace goes up a dir
  " nmap <buffer><nowait> <BS> <Plug>(fern-action-leave)<cr>

  " Toggle leaf on enter in drawer mode
  nmap <buffer><silent><expr>
        \ <Plug>(fern-my-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-leave)",
        \ )

  nmap <buffer><nowait> <CR> <Plug>(fern-my-expand-or-collapse)

  " Perform enter in explorer style but expand in drawer style
  nmap <buffer><expr>
        \ <Plug>(fern-my-expand-or-enter)
        \ fern#smart#drawer(
        \   "\<Plug>(fern-open-or-expand)",
        \   "\<Plug>(fern-open-or-enter)",
        \ )
  nmap <buffer><expr>
        \ <Plug>(fern-my-collapse-or-leave)
        \ fern#smart#drawer(
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-leave)",
        \ )
  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-enter)
  nmap <buffer><nowait> h <Plug>(fern-my-collapse-or-leave)

  " Find and enter project root
  nnoremap <buffer><silent>
        \ <Plug>(fern-my-enter-project-root)
        \ :<C-u>call fern#helper#call(funcref('<SID>map_enter_project_root'))<CR>
  nmap <buffer><expr><silent>
        \ ^
        \ fern#smart#scheme(
        \   "^",
        \   {
        \     'file': "\<Plug>(fern-my-enter-project-root)",
        \   }
        \ )
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
