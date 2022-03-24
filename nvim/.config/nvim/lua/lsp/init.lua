local status_ok, module = pcall(require, "nvim-lsp-installer")

if not status_ok then
	return
end

local lsp_handlers = require("lsp.handlers")
local cmp = require("cmp_nvim_lsp")
local null_ls = require("lsp.null_ls")

null_ls.setup()

-- Setup diagnostics
require("lsp.diagnostics")

-- Common server capabilities
local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Language Servers
module.on_server_ready(function(server)
	-- LSP Options: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
	local opts = {
		on_attach = lsp_handlers.on_attach,
		capabilities = capabilities,
	}

	-- Dinamically load config from "lua/lsp/servers"
	local server_exists, server_module = pcall(require, "lsp.servers." .. server.name)

	if server_exists then
		opts = server_module.setup(server, opts)
	else
		print("LSP server config not found (using defaults): " .. vim.inspect(server.name))
	end

	-- setup server config
	server:setup(opts)
end)
