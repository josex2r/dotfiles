local status_ok, trouble = pcall(require, "trouble")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "trouble.lua")
	return
end

trouble.setup()

-- Mappings
local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dl", "<cmd>TroubleToggle loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>TroubleToggle lsp_references<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
