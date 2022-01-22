local opts = { silent = true, noremap = true }

-- Trouble: Diasnostics results
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dl", "<cmd>TroubleToggle loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>TroubleToggle lsp_references<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", opts)
