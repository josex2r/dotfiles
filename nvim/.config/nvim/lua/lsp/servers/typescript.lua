local lsp_handlers = require("lsp.handlers")

local M = {}

M.setup = function(server, opts)
	require("typescript").setup({
		disable_commands = false, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		server = { -- pass options to lspconfig's setup method
			on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
				client.resolved_capabilities.document_range_formatting = false
				client.resolved_capabilities.format_on_save = true

				vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", { silent = true })

				lsp_handlers.on_attach(client, bufnr)
			end,
		},
	})
end

return M
