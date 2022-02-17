local status_ok, tree = pcall(require, "nvim-tree")

if not status_ok then
	return
end

vim.g.nvim_tree_icons = {
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
}

tree.setup({
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
    update_cwd = true,
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
