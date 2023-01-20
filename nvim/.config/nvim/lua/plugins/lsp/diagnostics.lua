local M = {}

local float_config = {
	focusable = false,
	header = "",
	source = "always",
	border = "rounded",
	prefix = "",
  width = 80,
}

function M.setup(opts)
  for name, icon in pairs(opts.icons) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  end

  vim.diagnostic.config(opts)

  M.enableFloatingWindow(opts)
end

function M.enableFloatingWindow(opts)
  if not opts.float then
    return
  end
  -- Show diagnostics when hovering over an error
  local group_name = "lsp_diagnostics"

  vim.api.nvim_create_augroup(group_name, { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
      vim.diagnostic.open_float(float_config)
    end,
    group = group_name,
  })
end

return M
