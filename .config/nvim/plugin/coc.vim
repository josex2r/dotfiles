" LSP
let g:coc_global_extensions = [
  \ 'coc-browser',
  \ 'coc-css',
  \ 'coc-ember',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-html-css-support',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-sh',
  \ 'coc-tsserver',
  \ 'coc-vimtex',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ ]

" Code
let g:coc_global_extensions += [
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-syntax',
  \ ]

" Utils
let g:coc_global_extensions += [
  \ 'coc-actions',
  \ 'coc-explorer',
  \ 'coc-fzf-preview',
  \ 'coc-git',
  \ 'coc-marketplace',
  \ ]

let g:coc_filetype_map = {
  \ 'html.handlebars': 'handlebars',
  \ 'glimmer': 'handlebars',
  \ }
