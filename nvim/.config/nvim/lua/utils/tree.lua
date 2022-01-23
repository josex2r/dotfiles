local M = {}

local offset = 31

M.toggle = function()
	require("nvim-tree").toggle(true)

	if require("nvim-tree.view").win_open() then
		require("bufferline.state").set_offset(offset, "File Tree")
	else
		require("bufferline.state").set_offset(0)
	end
end

M.find_file = function(path)
	if vim.api.nvim_buf_get_name(0) == "" then
		M.toggle()
	else
		require("nvim-tree").find_file(true)
		require("bufferline.state").set_offset(offset, "File Tree")
	end
end

M.open = function()
	require("bufferline.state").set_offset(offset, "File Tree")
	require("nvim-tree").find_file(true)
end

M.close = function()
	require("bufferline.state").set_offset(0)
	require("nvim-tree").close()
end

return M
