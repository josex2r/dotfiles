if &filetype !=# 'json' || v:version < 700
  finish
endif

setlocal equalprg=python\ -m\ json.tool

let b:undo_ftplugin .= '|setlocal equalprg<'
