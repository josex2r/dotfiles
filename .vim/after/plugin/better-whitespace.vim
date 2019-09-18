if !exists('g:loaded_better_whitespace_plugin')
  finish
endif

augroup betterwhitespace_config
  autocmd!
  autocmd BufWritePre * StripWhitespace
augroup END
