let g:VM_mouse_mappings = 1
nmap   <S-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <S-RightMouse>        <Plug>(VM-Mouse-Word)
nmap   <M-S-RightMouse>      <Plug>(VM-Mouse-Column)

let g:VM_maps = {}
let g:VM_maps['Find Under']                  = '<C-n>'
let g:VM_maps['Find Subword Under']          = '<C-n>'
let g:VM_maps["Select All"]                  = '\\A'
let g:VM_maps["Start Regex Search"]          = '\\/'
let g:VM_maps["Add Cursor Down"]             = '<S-Down>'
let g:VM_maps["Add Cursor Up"]               = '<S-Up>'

let g:VM_Mono_hl   = 'Todo'
let g:VM_Extend_hl = 'Substitute'
let g:VM_Cursor_hl = 'Visual'
let g:VM_Insert_hl = 'Todo'
