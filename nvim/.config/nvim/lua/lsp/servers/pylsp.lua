local lsp_handlers = require("lsp.handlers")

local M = {}

M.setup = function(server, opts)
	-- print("LSP server ready: " .. vim.inspect(server.name))

  -- use current venv if exist
	-- if os.getenv("VIRTUAL_ENV") ~= nil then
	-- 	opts.cmd = { os.getenv("VIRTUAL_ENV") .. "/bin/pylsp" }
	-- end
	--
 --  local curr_env = os.getenv("VIRTUAL_ENV") .. "/bin/pylsp"
	--
 --  print(curr_env)
	--
	-- opts.cmd.insert()
  -- opts.plugins = {
  --   mypy = true,
  -- }
  opts.cmd = { "pylsp", "-v", "--log-file", "/tmp/nvim-pylsp.log" }

  opts.on_attach = function(client, bufnr)
		-- Disable tsserver formatting
		-- client.resolved_capabilities.code_action = false

		-- defaults
		lsp_handlers.on_attach(client, bufnr)
	end


	return opts
end

return M
