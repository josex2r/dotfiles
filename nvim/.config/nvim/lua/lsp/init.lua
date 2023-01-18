local status_ok, mason = pcall(require, "mason")

if not status_ok then
	return
end

-- Setup diagnostics
require("lsp.diagnostics")

-- Setup Language Servers
require("lsp.servers")
