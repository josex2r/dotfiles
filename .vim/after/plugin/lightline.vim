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
      \   'linter': '%{LightlineCocHints()} %{LightlineCocWarnings()} %{LightlineCocErrors()}',
      \   'hints': '%{LightlineCocHints()}',
      \   'warnings': '%{LightlineCocWarnings()}',
      \   'errors': '%{LightlineCocErrors()}',
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

function! LightlineAleHints() abort
  let l:count = AleCount('info') + CocDiagnosticInfo('hint') + CocDiagnosticInfo('information')
  return l:count > 0 ? ' ✓ '.l:count : ''
endfunction

function! LightlineAleWarnings() abort
  let l:count = AleCount('warning') + CocDiagnosticInfo('warning')
  return l:count > 0 ? ' ⚠ '.l:count : ''
endfunction

function! LightlineAleErrors() abort
  let l:count = AleCount('error') + CocDiagnosticInfo('error')
  return l:count > 0 ? ' ✗ '.l:count : ''
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
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

  return join(msgs, '✓ ') " . ' ' . get(g:, 'coc_status', '')
endfunction
