require'nvim-tree'.setup {}

vim.cmd [[
  noremap <silent> <leader>t :lua require'utils.tree'.toggle()<CR><CR>
  nnoremap <leader>r :NvimTreeRefresh<CR>
  nnoremap <leader>n :NvimTreeFindFile<CR>
]]
