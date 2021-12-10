vim.api.nvim_set_keymap(
  'n',
  '<leader>sf',
  ':SearchBoxIncSearch<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'x',
  '<leader>sf',
  ':SearchBoxIncSearch visual_mode=true<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>sF',
  ':SearchBoxReplace<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'x',
  '<leader>sF',
  ':SearchBoxReplace visual_mode=true<CR>',
  {noremap = true}
)
