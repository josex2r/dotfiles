local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

telescope.load_extension("harpoon")

require("harpoon").setup({
	enter_on_sendcmd = true,
})

-- Mappings
vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hr", "<cmd>lua require('harpoon.mark').remove_file()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ht", "<cmd>lua require('harpoon.mark').toggle_file()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hc", "<cmd>lua require('harpoon.mark').clear_all()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>Telescope harpoon marks<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
