local M = {}

M.setup = function()
	vim.api.nvim_command("hi clear")

	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.o.termguicolors = true
end

M.load_theme = function(name)
	require("theme.colorschemes." .. name).setup()
end

return M
