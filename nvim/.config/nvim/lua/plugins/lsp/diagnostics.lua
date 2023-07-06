local M = {}

M.float_config = {
  focusable = true,
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
      M.toggle_diagnosticts()
    end,
    group = group_name,
  })
end

function M.toggle_diagnosticts()
  vim.diagnostic.open_float(M.float_config)
end

return M
