local status_ok, refactoring = pcall(require, "refactoring")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "refactoring.lua")
	return
end

refactoring.setup({})
