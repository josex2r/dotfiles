vim.cmd [[
autocmd BufRead,BufNewFile helm/*.yaml,*/templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml set ft=helm

" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
]]
