local lsp = require("lsp")
local M = {}

M.setup = function(server, opts)
  -- print("LSP server ready: " .. vim.inspect(server.name))

  opts.on_attach = function (client, bufnr)
    client.resolved_capabilities.format_on_save = false
    lsp.on_attach(client, bufnr)
  end

  return opts
end

return M
