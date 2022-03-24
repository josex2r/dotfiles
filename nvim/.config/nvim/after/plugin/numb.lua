local status_ok, numb = pcall(require, "numb")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "numb.lua")
	return
end

numb.setup()
