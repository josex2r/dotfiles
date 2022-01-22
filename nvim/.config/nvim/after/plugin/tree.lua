require("nvim-tree").setup({})

-- Mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
	"n",
	"<leader>t",
	"<cmd>lua if vim.api.nvim_buf_get_name(0) == '' then require('nvim-tree').toggle() else require('nvim-tree').find_file(true) end<CR>",
	opts
)
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", opts)
