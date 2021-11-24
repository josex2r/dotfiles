local M = {}

M.load_vim_config = function()
  local defaults = require('config.defaults')

  vim.opt.shortmess:append "c"

  vim.g.mapleader = defaults.options.leader

  for k, v in pairs(defaults.vim_options) do
    vim.opt[k] = v
  end
end

M.load_mappings = function()
  require('config.mappings').init()
end

M.load_theme = function()
  require('config.theme').init()
end

return M
