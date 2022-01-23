local M = {}

-- List all floating windows attached to the current buffer
function M.get_floating_windows()
	local list_wins = vim.api.nvim_list_wins()
	local current_win = vim.api.nvim_get_current_win()

	return vim.tbl_filter(function(v)
		local config = vim.api.nvim_win_get_config(v)

		return config.relative == "win" and config.win == current_win
	end, list_wins)
end

-- List all floating windows attached to the current buffer
function M.check_floating_windows()
	local ok, existing_float = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_preview")

	return ok and vim.api.nvim_win_is_valid(existing_float)
end

return M
