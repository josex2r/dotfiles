local lspconfig = require("lspconfig")
local lsp_handlers = require("lsp.handlers")
local capabilities = require("lsp.capabilities")

-- :lua print(vim.inspect(require('mason-lspconfig.mappings.server')))
-- vim.lsp.set_log_level("debug")

lspconfig.sumneko_lua.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.pyright.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
})

lspconfig.cssls.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
	yaml = {
		schemaStore = {
			enable = true,
		},
	},
})

lspconfig.eslint.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	settings = {},
})

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	server = { -- pass options to lspconfig's setup method
		on_attach = lsp_handlers.on_attach,
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
})
