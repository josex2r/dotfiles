local null_ls = require("null-ls")
-- local lspconfig = require("lspconfig")
local command_resolver = require("null-ls.helpers.command_resolver")

local M = {}

-- Rename as code-action
null_ls.register({
	name = "rename",
	method = null_ls.methods.CODE_ACTION,
	filetypes = { "_all" },
	generator = {
		fn = function(--[[ params ]])
			local actions = {}

			table.insert(actions, {
				title = "Rename LSP",
				action = function()
					vim.lsp.buf.rename()
				end,
			})
			return actions
		end,
	},
})

local config = {
	debug = true,
	debounce = 250,
	sources = {
		-- ---------------
		-- -  formating  -
		-- ---------------
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with({
      args = { "--config", "pyproject.toml", "$FILENAME", "--quiet" },
    }),

		-- ---------------
		-- - diagnostics -
		-- ---------------
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.pydocstyle,
		-- null_ls.builtins.diagnostics.eslint_d.with({
		--   prefer_local = "node_modules/.bin",
		--   cwd = function(params)
		--     return require("lspconfig")["tsserver"].get_root_dir(params.bufname)
		--   end,
		-- }),

		-- ---------------
		-- - code action -
		-- ---------------
		null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.eslint
		-- null_ls.builtins.code_actions.eslint_d.with({
		-- 	prefer_local = "node_modules/.bin",
		-- 	cwd = function(params)
		-- 		return lspconfig["tsserver"].get_root_dir(params.bufname)
		-- 	end,
		-- }),
	},
  null_ls.builtins.code_actions.refactoring,
}

M.setup = function(server, opts)
	-- Init "null-ls" for code formatting
	config.on_attach = require("lsp.handlers").on_attach

	null_ls.setup(config)
end

return M
