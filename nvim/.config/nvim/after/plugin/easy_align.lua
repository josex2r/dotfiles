-- Mappings
local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<leader>ce", "<cmd>EasyAlign<cr>", opts)
vim.api.nvim_set_keymap("x", "<leader>ce", "<cmd>EasyAlign<cr>", opts)
