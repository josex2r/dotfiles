local M = {}

M.setup = function()
	local status_ok, onedark = pcall(require, "onedark")

	if not status_ok then
		return
	end

	onedark.setup({
		style = "deep",
		toggle_style_key = "<leader>vs", -- Default keybinding to toggle
	})

	onedark.load()
end

return M
