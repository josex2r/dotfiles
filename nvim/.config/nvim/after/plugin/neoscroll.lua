local status_ok, neoscroll = pcall(require, "neoscroll")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "neoscroll.lua")
	return
end

neoscroll.setup()
