-- Mappings
local opts = { noremap = true }

vim.api.nvim_set_keymap("n", "<leader>ss", ":SearchBoxIncSearch<CR>", opts)
vim.api.nvim_set_keymap("x", "<leader>ss", ":SearchBoxIncSearch visual_mode=true<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>sS", ":SearchBoxReplace<CR>", opts)
vim.api.nvim_set_keymap("x", "<leader>sS", ":SearchBoxReplace visual_mode=true<CR>", opts)
