local fs = require('utils.fs')

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = fs.mkdir_here,
})
