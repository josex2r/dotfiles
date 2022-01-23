local M = {}

M.setup = function(server, opts)
	-- print("LSP server ready: " .. vim.inspect(server.name))

	opts.settings = {
		Lua = {
			diagnostics = {
				globals = {
					vim = true,
				},
			},
		},
	}

	return opts
end

return M
