local status_ok, packer = pcall(require, "packer")

vim.api.nvim_command("hi clear")

if vim.fn.exists("syntax_on") then
	vim.api.nvim_command("syntax reset")
end

vim.o.termguicolors = true

-- Use a protected call so we don't error out on first use
if status_ok then
	local onedark = require("onedark")

	onedark.setup({
		style = "deep",
    toggle_style_key = '<leader>vs', -- Default keybinding to toggle
	})
	onedark.load()
end
