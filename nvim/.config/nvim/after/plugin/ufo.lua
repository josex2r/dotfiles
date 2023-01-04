local status_ok, ufo = pcall(require, "ufo")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "ufo.lua")
	return
end

vim.wo.foldcolumn = "0"
vim.wo.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.wo.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

ufo.setup({
	provider_selector = function(bufnr, filetype)
		return { "treesitter", "indent" }
	end,
})
