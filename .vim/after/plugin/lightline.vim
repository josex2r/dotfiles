if !exists('g:loaded_lightline')
  finish
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [
      \       [ 'mode', 'modified', 'paste' ],
      \	      [ 'path' ],
      \	      [ 'readonly' ],
      \   ],
      \   'right': [
      \       [ 'coccustomstatus' ],
      \       [ 'lineinfo' ],
      \	      [ 'percent' ],
      \       [ 'linter' ],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \	      [ 'readonly', 'filename', 'modified' ]
      \   ],
      \   'right': [
      \       [ 'lineinfo' ],
      \	      [ 'percent' ],
      \   ]
      \ },
      \ 'component': {
      \   'modified': '%{MyModified()}',
      \   'coccustomstatus': '%{StatusDiagnostic()}',
      \   'linter': '%{LightlineHints()} %{LightlineWarnings()} %{LightlineErrors()}',
      \   'hints': '%{LightlineHints()}',
      \   'warnings': '%{LightlineWarnings()}',
      \   'errors': '%{LightlineErrors()}',
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'LightlineGitBranch',
      \   'path': 'LightlinePath',
      \ }
      \ }
"      \	      [ 'fileformat', 'fileencoding', 'filetype' ],

function! MyModified()
  " Unidentifies modes uses normal color mode
  let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  " Get editor mode from the previous map
  let mode = get(map, mode()[0], mode()[0])
  " Colors from:
  " https://github.com/itchyny/lightline.vim/blob/master/autoload/lightline/colorscheme/one.vim
  let bgcolor = {'n': [76, '#98c379'], 'i': [75, '#61afef'], 'v': [176, '#c678dd']}
  return &modified ? '' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly() abort
    return &readonly ? '' : ''
endfunction

function! LightlineGitBranch() abort
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlinePath() abort
    return '📁'.fnamemodify(expand('%'), ':~:.')
endfunction

function! AleCount(type) abort
  let l:bufnr = bufnr('%')
  let l:count = ale#statusline#Count(l:bufnr)
  if empty(l:count) | return 0 | endif
  return get(l:count, a:type, 0)
endfunction

function! CocDiagnosticInfo(type) abort
  let l:info = get(b:, 'coc_diagnostic_info', {})
  if empty(l:info) | return 0 | endif
  return get(l:info, a:type, 0)
endfunction

function! LightlineHints() abort
  let l:count = AleCount('info') + CocDiagnosticInfo('hint') + CocDiagnosticInfo('information')
  return l:count > 0 ? ' ✓ '.l:count : ''
endfunction

function! LightlineWarnings() abort
  let l:count = AleCount('warning') + CocDiagnosticInfo('warning')
  return l:count > 0 ? ' ⚠ '.l:count : ''
endfunction

function! LightlineErrors() abort
  let l:count = AleCount('error') + CocDiagnosticInfo('error')
  return l:count > 0 ? ' ✗ '.l:count : ''
endfunction

augroup lightline_update
  autocmd!
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  " autocmd User ALELintPOST call lightline#update()
  " autocmd User CocDiagnosticChange call lightline#update()
augroup END

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []

  if get(info, 'error', 0)
    call add(msgs, '✗ ' . info['error'])
  endif

  if get(info, 'warning', 0)
    call add(msgs, '⚠ ' . info['warning'])
  endif

  return join(msgs, '✓ ') . ' ' . get(g:, 'coc_status', '')
endfunction
