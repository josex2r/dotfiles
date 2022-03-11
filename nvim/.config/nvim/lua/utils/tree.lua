local M = {}

local offset = 31

M.toggle = function()
	require("nvim-tree").toggle(true)
end

M.find_file = function(path)
	if vim.api.nvim_buf_get_name(0) == "" then
		M.toggle()
	else
		require("nvim-tree").find_file(true)
	end
end

M.open = function()
	require("nvim-tree").find_file(true)
end

M.close = function()
	require("nvim-tree").close()
end

return M
