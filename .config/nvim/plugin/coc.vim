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
  \ 'coc-sumneko-lua',
  \ 'coc-webpack',
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
  \ 'coc-marketplace',
  \ ]

let g:coc_filetype_map = {
  \ 'html.handlebars': 'handlebars',
  \ 'glimmer': 'handlebars',
  \ }

call coc#config('suggest', {
  \   'completionItemKindLabels': {
  \     'function'              : "\uf794",
  \     'method'                : "\uf6a6",
  \     'variable'              : "\uf71b",
  \     'constant'              : "\uf8ff",
  \     'struct'                : "\ufb44",
  \     'class'                 : "\uf0e8",
  \     'interface'             : "\ufa52",
  \     'text'                  : "\ue612",
  \     'enum'                  : "\uf435",
  \     'enumMember'            : "\uf02b",
  \     'module'                : "\uf668",
  \     'color'                 : "\ue22b",
  \     'property'              : "\ufab6",
  \     'field'                 : "\uf93d",
  \     'unit'                  : "\uf475",
  \     'file'                  : "\uf471",
  \     'value'                 : "\uf8a3",
  \     'event'                 : "\ufacd",
  \     'folder'                : "\uf115",
  \     'keyword'               : "\uf893",
  \     'snippet'               : "\uf64d",
  \     'operator'              : "\uf915",
  \     'reference'             : "\uf87a",
  \     'typeParameter'         : "\uf278",
  \     'default'               : "\uf29c"
  \   }
  \ })
