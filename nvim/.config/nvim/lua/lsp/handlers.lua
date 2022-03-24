local debug = require("utils.debug")

local M = {}

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

function setup_aerial(client, bufnr)
  local status_ok, aerial = pcall(require, "aerial")

	if not status_ok then
		debug.log.error("Error attaching 'aerial' to the language server", "lsp.handlers.lua")
	end

  -- Add code symbols
	aerial.on_attach(client)
end

function setup_lsp_signature(client, bufnr)
  local status_ok, signature = pcall(require, "lsp_signature")

	if not status_ok then
		debug.log.error("Error attaching 'lsp_signature' to the language server", "lsp.handlers.lua")
	end
	-- Signature help for function arguments
	signature.on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded",
		},
		floating_window_off_x = 5,
		floating_window_off_y = 20,
		hi_parameter = "DiagnosticHint",
	}, bufnr)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
	buf_set_keymap("n", "<leader>ck", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- buf_set_keymap("n", "<leader>cd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>cd", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	buf_set_keymap("n", "<leader>cn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	buf_set_keymap("n", "<leader>cq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "<space>va", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>vr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>vl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

	setup_aerial(client, bufnr)
	setup_lsp_signature(client, bufnr)

	-- Format on save
	if client.resolved_capabilities.format_on_save then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

return M
