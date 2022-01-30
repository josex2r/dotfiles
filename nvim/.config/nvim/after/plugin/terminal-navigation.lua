if vim.g.loaded_kitty_navigator then
    vim.cmd([[
    let g:kitty_navigator_no_mappings = 1
    ]])

  local opts = { silent = true }

  vim.api.nvim_set_keymap("n", "<C-Left>", "<cmd>KittyNavigateLeft<CR>", opts)
  vim.api.nvim_set_keymap("n", "<C-Right>", "<cmd>KittyNavigateRight<CR>", opts)
  vim.api.nvim_set_keymap("n", "<C-Up>", "<cmd>KittyNavigateUp<CR>", opts)
  vim.api.nvim_set_keymap("n", "<C-Down>", "<cmd>KittyNavigateDown<CR>", opts)
else
    vim.cmd([[
      nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
      nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
      nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
      nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
    ]])
end
