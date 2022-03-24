local status_ok, fidget = pcall(require, "fidget")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "fidget.lua")
	return
end

fidget.setup({})
