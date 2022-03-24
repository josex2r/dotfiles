local status_ok, aerial = pcall(require, "aerial")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "aerial.lua")
	return
end

aerial.setup({
	backends = { "lsp", "treesitter", "markdown" },
	filter_kind = false,
	max_width = 50,
	min_width = 20,
	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
		-- Jump forwards/backwards with '{' and '}'
		vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
		-- Jump up the tree with '[[' or ']]'
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
	end,
})
