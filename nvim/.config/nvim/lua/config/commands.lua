local debug = require("utils.debug")

-- alias can help create new vim command.
-- @param cmd The user command
-- @param repl The actual command or function
-- @param force force create command? boolean
local alias = function(cmd, repl, force)
	local command

	if force then
		command = "command! " .. cmd .. " " .. repl
	else
		command = "command " .. cmd .. " " .. repl
	end

	local ok, err = pcall(vim.cmd, command)

	if not ok then
		debug.log.error("setting cmd: " .. cmd .. " " .. err, "config.ommands.lua")
	end
end

-- Copy current file full path
alias("CopyFullPath", [[execute "let @+ = expand('%:p')"]])

-- Copy current file path
alias("CopyPath", [[execute "let @+ = fnamemodify(expand(\"%\"), \":~:.\")"]])

-- Copy current file path
alias("CopyName", [[execute "let @+ = expand('%:t')"]])

-- RipGrep alias
alias("-nargs=+ -complete=dir Find", [[execute 'silent grep!' <q-args> | copen | redraw!]])
