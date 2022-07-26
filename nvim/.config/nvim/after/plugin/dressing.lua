local status_ok, dressing = pcall(require, "dressing")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "dressing.lua")
	return
end

dressing.setup({
	input = {
		enabled = false,
	},
})
