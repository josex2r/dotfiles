local M = {}

M.init = function()
  vim.api.nvim_command "hi clear"

  if vim.fn.exists "syntax_on" then
    vim.api.nvim_command "syntax reset"
  end

  vim.o.termguicolors = true

  -- onedark
  require('onedark').setup {
    style = 'darker'
  }
  require('onedark').load()
end

return M
