local M = {}

M.setup = function()
	local status_ok, catppuccin = pcall(require, "catppuccin")

	if not status_ok then
		return
	end

	catppuccin.setup({
		flavour = "macchiato",
	})

	vim.cmd("colorscheme catppuccin")
end

return M
