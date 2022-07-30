local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Diagnostics
vim.diagnostic.config({
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
    header = "",
		style = "minimal",
		border = "single",
		source = "always",
		prefix = "",
	},
	virtual_text = {
		prefix = "●",
		spacing = 2,
		source = "always",
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
	},
})

-- Show diagnostics when hovering over an error
vim.cmd([[
  augroup lsp_diagnostics
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float({ focusable = false, border = "single", width = 80 })
  augroup END
]])
