require'nvim-tree'.setup {}

vim.cmd [[
  nnoremap <leader>r :NvimTreeRefresh<CR>
  nnoremap <leader>n :NvimTreeFindFile<CR>
]]

vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  "<cmd>lua if vim.api.nvim_buf_get_name(0) == '' then require('nvim-tree').toggle() else require('nvim-tree').find_file(true) end<CR>",
  { noremap = true, silent = true }
)
