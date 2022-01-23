local M = {}

M.setup = function(server, opts)
	-- print("LSP server ready: " .. vim.inspect(server.name))

	opts.settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	}

	return opts
end

return M
