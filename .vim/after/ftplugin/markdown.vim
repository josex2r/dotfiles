if &filetype !=# 'markdown' || v:version < 700
  finish
endif

setlocal wrap
setlocal formatoptions=t1
setlocal noexpandtab
setlocal linebreak
setlocal smartindent
setlocal synmaxcol=3000
setlocal display=lastline

let b:undo_ftplugin .= '|setlocal wrap<'
      \ . '|setlocal formatoptions<'
      \ . '|setlocal noexpandtab<'
      \ . '|setlocal linebreak<'
      \ . '|setlocal smartindent<'
      \ . '|setlocal synmaxcol<'
      \ . '|setlocal display<'

if has('spell') && &modifiable && !&readonly
  setlocal spell
  setlocal spelllang=es_es
  let b:undo_ftplugin .= '|setlocal spell<'
      \ . '|setlocal spelllang<'
endif
