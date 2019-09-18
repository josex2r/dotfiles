if !exists(':LanguageClientStart')
  finish
endif

" Needs:
"  - npm install -g javascript-typescript-langserver
"  - pip3 install python-language-server
if executable('npm') && !executable('javascript-typescript-stdio')
  call system('npm install -g javascript-typescript-langserver')
endif
if executable('pip3') && !executable('pyls')
  call system('pip3 install python-language-server')
endif

" Keybindings.
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" Config.
let g:LanguageClient_diagnosticsList = 'Location'
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'python': ['pyls'],
      \ }
