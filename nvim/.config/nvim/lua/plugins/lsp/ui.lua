local float_config = {
	focusable = true,
	style = "minimal",
	border = "rounded",
	source = "always",
	header = "",
	prefix = "",
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)
