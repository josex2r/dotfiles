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

M.log = {}

M.log._notify = function(msg, title, level)
  local status_ok, notify = pcall(require, "notify")

  if not status_ok then
    notify = vim.notify
  end

  notify(msg, level, {
    title = title or "Debug log",
  })
end

M.log.error = function(msg, title)
  M.log._notify(msg, title, vim.log.levels.ERROR)
end

M.log.info = function(msg, title)
  M.log._notify(msg, title, vim.log.levels.Info)
end

M.log.warn = function(msg, title)
  M.log._notify(msg, title, vim.log.levels.WARN)
end

M.log.debug = function(msg, title)
  M.log._notify(msg, title, vim.log.levels.DEBUG)
end

return M
