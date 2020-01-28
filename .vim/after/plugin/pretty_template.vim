if exists('g:loaded_js_pretty_template')
  finish
endif

" Register tag name associated the filetype
" call jspretmpl#register_tag('css', 'scss')

augroup prettytemplate_config
    autocmd!

    autocmd FileType javascript JsPreTmpl
augroup END
