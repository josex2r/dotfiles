if &filetype !=# 'sh' || v:version < 700
  finish
endif

setlocal formatprg=shfmt\ -bn\ -ci

if expand('%:e') ==# 'bats'
  " execute ':ALEDisableBuffer'
endif

let b:undo_ftplugin .= '|setlocal formatprg<'
