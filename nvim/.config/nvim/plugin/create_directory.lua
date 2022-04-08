vim.cmd([[
augroup create_directory
    autocmd!
    autocmd BufWritePre * lua require('utils.fs').mkdir_here()
augroup END
]])
