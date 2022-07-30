local M = {}

M.setup = function()
	local status_ok, nightfox = pcall(require, "nightfox")

	if not status_ok then
		return
	end

  nightfox.setup({
    options = {
      styles = {
        comments = "italic,bold",
        keywords = "bold",
        functions = "italic,bold",
      },
    },
	})

  vim.cmd('colorscheme nightfox')
end

return M
