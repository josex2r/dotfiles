local status_ok, neogen = pcall(require, "neogen")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "neogen.lua")
	return
end

neogen.setup({})

-- Mappings
local opts = { noremap = true, silent = true }

-- Files
vim.api.nvim_set_keymap("n", "<leader>nc", "<cmd>lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>nf", "<cmd>lua require('neogen').generate({ type = 'function' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>nF", "<cmd>lua require('neogen').generate({ type = 'file' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>lua require('neogen').generate({ type = 'type' })<CR>", opts)
