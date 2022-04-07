local status_ok, breakpoints = pcall(require, "dap.breakpoints")

if not status_ok then
	return
end

local io = require("io")
local os = require("os")

local M = {}
local HOME = os.getenv("HOME")
local BREAKPOINTS_DIR = HOME .. "/.cache/dap"
local BREAKPOINTS_FILE = "breakpoints.json"
local BREAKPOINTS_PATH = BREAKPOINTS_DIR .. "/" .. BREAKPOINTS_FILE

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function M.save(clear)
  local bps = {}

  if file_exists(BREAKPOINTS_PATH) then
    local load_bps_raw = io.open(BREAKPOINTS_PATH, "r"):read("*a")
    bps = vim.fn.json_decode(load_bps_raw)
  else
    vim.cmd(':silent !mkdir -p ' .. BREAKPOINTS_DIR)
  end

	local breakpoints_by_buf = breakpoints.get()

	if clear then
		for _, bufrn in ipairs(vim.api.nvim_list_bufs()) do
			local file_path = vim.api.nvim_buf_get_name(bufrn)
			if bps[file_path] ~= nil then
				bps[file_path] = {}
			end
		end
	else
		for buf, buf_bps in pairs(breakpoints_by_buf) do
			bps[vim.api.nvim_buf_get_name(buf)] = buf_bps
		end
	end

	local fp = io.open(BREAKPOINTS_PATH, "w")
	local final = vim.fn.json_encode(bps)

	fp:write(final)
	fp:close()
end

function M.load()
	local fp = io.open(BREAKPOINTS_PATH, "r")
	local content = fp:read("*a")
	local bps = vim.fn.json_decode(content)
	local loaded_buffers = {}
	local found = false

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local file_name = vim.api.nvim_buf_get_name(buf)
		if bps[file_name] ~= nil and bps[file_name] ~= {} then
			found = true
		end
		loaded_buffers[file_name] = buf
	end

	if found == false then
		return
	end

	for path, buf_bps in pairs(bps) do
		for _, bp in pairs(buf_bps) do
			local line = bp.line
			local opts = {
				condition = bp.condition,
				log_message = bp.logMessage,
				hit_condition = bp.hitCondition,
			}
			breakpoints.set(opts, tonumber(loaded_buffers[path]), line)
		end
	end
end

return M
