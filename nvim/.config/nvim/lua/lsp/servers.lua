local lspconfig = require("lspconfig")
local lsp_handlers = require("lsp.handlers")
local capabilities = require("lsp.capabilities")

-- :lua print(vim.inspect(require('mason-lspconfig.mappings.server')))
-- vim.lsp.set_log_level("debug")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

--[[ lspconfig.sumneko_lua.setup({ ]]
--[[ 	on_attach = lsp_handlers.on_attach, ]]
--[[ 	capabilities = capabilities, ]]
--[[ 	settings = { ]]
--[[     enable = false, ]]
--[[ 		Lua = { ]]
--[[ 			runtime = { ]]
--[[ 				version = "LuaJIT", ]]
--[[ 				path = runtime_path, ]]
--[[ 			}, ]]
--[[ 			diagnostics = { ]]
--[[ 				globals = { "vim" }, ]]
--[[ 			}, ]]
--[[ 			workspace = { ]]
--[[ 				library = { ]]
--[[ 					vim.api.nvim_get_runtime_file("", true), ]]
--[[ 				}, ]]
--[[ 			}, ]]
--[[ 			telemetry = { ]]
--[[ 				enable = false, ]]
--[[ 			}, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]

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
			validate = { enable = true },
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

lspconfig.bashls.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
})

lspconfig.denols.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("deps.ts"),
})

lspconfig.terraformls.setup({
	on_attach = lsp_handlers.on_attach,
	capabilities = capabilities,
})

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	server = { -- pass options to lspconfig's setup method
    root_dir = lspconfig.util.root_pattern("package.json"),
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
