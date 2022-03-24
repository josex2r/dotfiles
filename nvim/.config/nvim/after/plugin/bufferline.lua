local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	return
end

bufferline.setup({
	options = {
		always_show_bufferline = true,
		-- separator_style = "slant",
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
