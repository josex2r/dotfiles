local M = {}

function M.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(table.unpack(objects))
	return ...
end

-- Convert an array into a truth table
--
-- Example:
--  { 'foo' } => { ['foo'] = true }
function M.array_to_table(a)
	local t = {}

	for _, v in pairs(a) do
		t[v] = true
	end

	return t
end

return M
