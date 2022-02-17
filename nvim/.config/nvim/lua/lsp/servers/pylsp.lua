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

	return opts
end

return M
