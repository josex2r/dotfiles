local status_ok, scrollbar = pcall(require, "scrollbar")

if not status_ok then
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
