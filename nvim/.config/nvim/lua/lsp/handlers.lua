local debug = require("utils.debug")
local telescope = require("telescope.builtin")

M = {}

local float_config = {
	focusable = true,
	style = "minimal",
	border = "rounded",
	source = "always",
	header = "",
	prefix = "",
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
  function getopts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end
	local telescope_opts = {} --{ jump_type = "split" }

  -- Show LSP hint
	vim.keymap.set("n", "K", vim.lsp.buf.hover, getopts("Typing info"))

  -- LSP Navigation
  vim.keymap.set("n", "gd", function()
		telescope.lsp_definitions(telescope_opts)
		-- vim.lsp.buf.definition()
	end, getopts("Go to definition"))
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, getopts("Go to Declaration"))
	vim.keymap.set("n", "gi", function()
		telescope.lsp_implementations(telescope_opts)
		-- vim.lsp.buf.implementation()
	end, getopts("Go to Implementations"))
	vim.keymap.set("n", "gr", function()
		telescope.lsp_references(telescope_opts)
		-- vim.lsp.buf.references()
	end, getopts("Go to References"))
	vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, getopts("Signature Help"))
  vim.keymap.set("n", "gt", function()
		telescope.lsp_type_definitions(telescope_opts)
		-- vim.lsp.buf.type_definition()
	end, getopts("Type Definitions"))

	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, getopts("Workspace Symbols"))
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, getopts("Add Workspace"))
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, getopts("Remove workspace"))
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, getopts("List workspace"))

  -- Rename Symbol
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, getopts("Rename in Buffer"))

  -- Codelens
	vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.refresh, getopts("Codelens Refresh"))
	vim.keymap.set("n", "<leader>cL", vim.lsp.codelens.run, getopts("Codelens Run"))

  -- Code Action
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, getopts("Code Actions"))
	vim.keymap.set("v", "<leader>ca", function()
    vim.lsp.buf.range_code_action()
  end, getopts("Code Actions"))

  -- Format Code
  vim.keymap.set('n', '<space>cf', function()
    vim.lsp.buf.format({ async = true })
  end, getopts("Format code"))

	--[[ vim.keymap.set("n", "<leader>cq", vim.lsp.diagnostic.setloclist, bufopts) ]]
  --
end

return M
