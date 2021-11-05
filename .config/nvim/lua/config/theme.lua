local M = {}

M.init = function()
  vim.api.nvim_command "hi clear"
  if vim.fn.exists "syntax_on" then
    vim.api.nvim_command "syntax reset"
  end
  vim.o.termguicolors = true
  vim.cmd [[
    let g:onedark_style = 'darker'
    colorscheme onedark
  ]]
end

return M
