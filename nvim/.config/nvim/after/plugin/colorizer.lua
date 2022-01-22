require("colorizer").setup({
	"*", -- Highlight all files, but customize some others.
	"!vim", -- Exclude vim from highlighting.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
})
