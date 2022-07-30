local fs = require('utils.fs')
local M = {}

---Get the full path to `data` dir
---@return string
function M.get_runtime_dir()
	return vim.call("stdpath", "data")
end

---Get the full path to `config` dir
---@return string
function M.get_config_dir()
	return vim.call("stdpath", "config")
end

---Get the full path to `cache` dir
---@return string
function M.get_cache_dir()
	return vim.call("stdpath", "cache")
end

---Get the full path to `undo` dir
---@return string
function M.get_undo_dir()
	return fs.join_paths(M.get_config_dir(), "undo")
end

return M
