local status_ok, scrollbar = pcall(require, "scrollbar")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "scrollbar.lua")
	return
end

scrollbar.setup({
	handle = {
		color = "#333840",
	},
	handlers = {
		diagnostic = true,
		search = true, -- Requires hlslens to be loaded
	},
})

require("scrollbar.handlers.search").setup()
