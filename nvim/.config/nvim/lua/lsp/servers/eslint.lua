local lsp_handlers = require("lsp.handlers")
local M = {}

M.setup = function(server, opts)
	-- print("LSP server ready: " .. vim.inspect(server.name))

	opts.on_attach = function(client, bufnr)
		-- Disable eslint formatting
		client.resolved_capabilities.document_formatting = true
		lsp_handlers.on_attach(client, bufnr)
	end

	return opts
end

return M
