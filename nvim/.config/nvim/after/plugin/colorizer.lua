local status_ok, colorizer = pcall(require, "colorizer")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "colorizer.lua")
	return
end

colorizer.setup({
	"*", -- Highlight all files, but customize some others.
	"!vim", -- Exclude vim from highlighting.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
})
