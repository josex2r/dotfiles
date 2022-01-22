require("spectre").setup({
	highlight = {
		search = "IncSearch",
		replace = "debugBreakpoint",
	},
})

-- Mappings
local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<leader>sf", "<cmd>lua require('spectre').open_file_search()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>sF", "<cmd>lua require('spectre').open_visual({ select_word=true })<cr>", opts)
