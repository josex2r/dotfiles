local status_ok, leap = pcall(require, "leap")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "leap.lua")
	return
end

leap.set_default_keymaps()
