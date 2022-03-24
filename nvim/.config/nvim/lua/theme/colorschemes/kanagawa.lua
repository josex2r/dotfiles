local M = {}

M.setup = function()
	local status_ok, kanagawa = pcall(require, "kanagawa")

	if not status_ok then
		return
	end

	kanagawa.setup({
    commentStyle = "italic",
    functionStyle = "italic",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    globalStatus = vim.o.laststatus == 3,
	})

	kanagawa.load()
end

return M
