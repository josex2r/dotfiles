local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local float_config = {
	focusable = false,
	header = "",
	source = "always",
	border = "rounded",
	prefix = "",
  width = 80,
}

-- Diagnostics
vim.diagnostic.config({
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = float_config,
	virtual_text = false,
	-- virtual_text = {
	-- 	prefix = "●",
	-- 	spacing = 2,
	-- 	source = "always",
	--    severity = {
	--      min = vim.diagnostic.severity.WARN,
	--    },
	-- },
})

-- Show diagnostics when hovering over an error
local group_name = "lsp_diagnostics"

vim.api.nvim_create_augroup(group_name, { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(float_config)
  end,
  -- command = "lua vim.diagnostic.open_float({ focusable = false, border = "single", width = 80 })",
  group = group_name,
})
