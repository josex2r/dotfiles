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

function setup_lsp_signature(client, bufnr)
	local status_ok, signature = pcall(require, "lsp_signature")

	if not status_ok then
		debug.log.error("Error attaching 'lsp_signature' to the language server", "lsp.handlers.lua")
	end

	-- Signature help for function arguments
	signature.on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = float_config,
		hi_parameter = "ModeMsg",
	}, bufnr)
end

function setup_lsp_hints(client, bufnr)
	local status_ok, hints = pcall(require, "lsp-inlayhints")

	if not status_ok then
		hints.setup()
		hints.on_attach(client, bufnr, false)
	end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local telescope_opts = {} --{ jump_type = "split" }

  -- Show LSP hint
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

  -- LSP Navigation
  vim.keymap.set("n", "gd", function()
		telescope.lsp_definitions(telescope_opts)
		-- vim.lsp.buf.definition()
	end, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gi", function()
		telescope.lsp_implementations(telescope_opts)
		-- vim.lsp.buf.implementation()
	end, bufopts)
	vim.keymap.set("n", "gr", function()
		telescope.lsp_references(telescope_opts)
		-- vim.lsp.buf.references()
	end, bufopts)
	vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "gt", function()
		telescope.lsp_type_definitions(telescope_opts)
		-- vim.lsp.buf.type_definition()
	end, bufopts)

	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)

  -- Rename Symbol
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)

  -- Codelens
	vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.refresh, bufopts)
	vim.keymap.set("n", "<leader>cL", vim.lsp.codelens.run, bufopts)

  -- Code Action
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("v", "<leader>ca", function()
    vim.lsp.buf.range_code_action()
  end, bufopts)

  -- Format Code
  vim.keymap.set('n', '<space>cf', function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

	--[[ vim.keymap.set("n", "<leader>cq", vim.lsp.diagnostic.setloclist, bufopts) ]]
  --

	setup_lsp_signature(client, bufnr)
	setup_lsp_hints(client, bufnr)
end

return M
