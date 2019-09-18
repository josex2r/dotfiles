if !exists('g:loaded_lightline')
  finish
endif

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [
      \       [ 'mode', 'paste' ],
      \		    [ 'gitbranch' ],
      \		    [ 'path' ],
      \		    [ 'readonly', 'filename', 'modified' ],
      \   ],
      \   'right': [
      \        [ 'errors', 'warnings', 'hints' ],
      \        [ 'lineinfo' ],
      \		     [ 'percent' ],
      \		     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \		    [ 'readonly', 'filename', 'modified' ]
      \   ],
      \   'right': [
      \        [ 'lineinfo' ],
      \		     [ 'percent' ],
      \		     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'LightlineGitBranch',
      \   'path': 'LightlinePath',
      \	  'hints': 'LightlineHints',
      \	  'warnings': 'LightlineWarnings',
      \	  'errors': 'LightlineErrors',
      \ },
      \ 'component_type': {
      \   'hints': 'info',
      \   'warnings': 'warning',
      \   'errors': 'error',
      \ }
      \ }

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
    return fnamemodify(expand('%:h'), ':~:.')
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
  return l:count > 0 ? l:count : ''
endfunction

function! LightlineWarnings() abort
  let l:count = AleCount('warning') + CocDiagnosticInfo('warning')
  return l:count > 0 ? l:count : ''
endfunction

function! LightlineErrors() abort
  let l:count = AleCount('error') + CocDiagnosticInfo('error')
  return l:count > 0 ? l:count : ''
endfunction

augroup lightline_update
  autocmd!
  autocmd User ALELintPOST call lightline#update()
  autocmd User CocDiagnosticChange call lightline#update()
augroup END
