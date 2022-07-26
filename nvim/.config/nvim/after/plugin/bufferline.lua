local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "bufferline.lua")
	return
end

bufferline.setup({
	options = {
		always_show_bufferline = true,
		separator_style = "slant",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
