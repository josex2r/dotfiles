local lsp = require("lsp")
local util = require 'lspconfig/util'
local M = {}

M.setup = function(server, opts)
  -- print("LSP server ready: " .. vim.inspect(server.name))

  opts.root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", ".git")

  opts.on_attach = function (client, bufnr)
    -- Disable tsserver formatting
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    client.resolved_capabilities.format_on_save = true

    lsp.on_attach(client, bufnr)
  end

  return opts
end

return M
