let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '▸ '
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
      \ 'bash': ['shellcheck'],
      \ 'handlebars': ['ember-template-lint'],
      \ 'javascript': ['eslint'],
      \ 'python': ['pylint'],
      \ 'rust': ['rls'],
      \ 'zsh': ['shellcheck'],
      \ }
let g:ale_fix_on_save = 0
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }
