local status_ok, mason = pcall(require, "mason")

if not status_ok then
	return
end

mason.setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
    "sumneko_lua",
    "eslint",
    "pyright",
    "jsonls",
    "bashls",
    "cssls",
    "html",
    "yamlls",
  },
})

-- null_ls
require("lsp.null_ls").setup()

-- Setup diagnostics
require("lsp.diagnostics")

-- Setup Language Servers
require("lsp.servers")
