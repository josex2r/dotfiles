local status_ok, tree = pcall(require, "nvim-tree")

if not status_ok then
	return
end

tree.setup({})

-- Mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
	"n",
	"<leader>t",
	"<cmd>lua require('utils.tree').find_file()<CR>",
	opts
)
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>:lua require('utils.tree').toggle()<CR>", opts)
