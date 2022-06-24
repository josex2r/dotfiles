local status_ok, tree = pcall(require, "nvim-tree")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "nvim-tree.lua")
	return
end

tree.setup({
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
})

-- Mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua require('utils.tree').find_file()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>:lua require('utils.tree').toggle()<CR>", opts)
