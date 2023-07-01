local u = require("functions.utils")
local io = require("io")
local os = require("os")
local breakpoints = require("dap.breakpoints")
local constants = require('constants')

local M = {}

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- We are pulling this function out of nvim.dap because
-- we want to customize the behavior of the process picker

--- Return running processes as a list with { pid, name } tables.
function M.get_processes()
  local is_windows = vim.fn.has('win32') == 1
  local separator = is_windows and ',' or ' \\+'
  local command = is_windows and { 'tasklist', '/nh', '/fo', 'csv' } or { 'ps', 'ah' }

  -- output format for `tasklist /nh /fo` csv
  --    '"smss.exe","600","Services","0","1,036 K"'
  -- output format for `ps ah`
  --    " 107021 pts/4    Ss     0:00 /bin/zsh <args>"
  local get_pid = function(parts)
    if is_windows then
      return vim.fn.trim(parts[2], '"')
    else
      return parts[1]
    end
  end

  local get_process_name = function(parts)
    if is_windows then
      return vim.fn.trim(parts[1], '"')
    else
      return table.concat({ unpack(parts, 5) }, ' ')
    end
  end

  local output = vim.fn.system(command)
  local lines = vim.split(output, '\n')
  local procs = {}

  local unwanted_processes = {
    '-zsh',
    '/opt/homebrew/bin/nvim',
    u.get_home() .. "/.cache/gitstatus/gitstatusd-darwin-arm64",
    'tmux'
  }

  local nvim_pid = vim.fn.getpid()
  for _, line in pairs(lines) do
    if line ~= "" then -- tasklist command outputs additional empty line in the end
      local parts = vim.fn.split(vim.fn.trim(line), separator)
      local pid, name = get_pid(parts), get_process_name(parts)
      pid = tonumber(pid)
      if pid and pid ~= nvim_pid then
        local wanted = true
        for _, unwanted in ipairs(unwanted_processes) do
          if u.string_starts(name, unwanted) then
            wanted = false
            break
          end
        end
        if wanted then
          table.insert(procs, { pid = pid, name = name })
        end
      end
    end
  end

  return procs
end

--- Show a prompt to select a process pid
function M.pick_process()
  local label_fn = function(proc)
    return string.format("id=%d name=%s", proc.pid, proc.name)
  end
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local procs = M.get_processes()
      require('dap.ui').pick_one(procs, "Select process", label_fn, function(choice)
        coroutine.resume(co, choice and choice.pid or nil)
      end)
    end)
  else
    local procs = M.get_processes()
    local result = require('dap.ui').pick_one_sync(procs, "Select process", label_fn)
    return result and result.pid or nil
  end
end

function M.save(clear)
  local bps = {}

  if file_exists(constants.breakpoints_path) then
    local load_bps_raw = io.open(constants.breakpoints_path, "r"):read("*a")
    bps = vim.fn.json_decode(load_bps_raw)
  else
    vim.cmd(':silent !mkdir -p ' .. constants.breakpoints_dir)
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

	local fp = io.open(constants.breakpoints_path, "w")
	local final = vim.fn.json_encode(bps)

	fp:write(final)
	fp:close()
end

function M.load()
	local fp = io.open(constants.breakpoints_path, "r")
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
