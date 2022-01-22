-- Mappings
local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<leader>gB", "<cmd>Git blame<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Git commit<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Git diff<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ge", "<cmd>DiffviewOpen<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gE", "<cmd>DiffviewClose<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gm", "<cmd>Git mergetool<cr>", opts)
