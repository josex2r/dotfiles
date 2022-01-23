local M = {}

M.load_vim_config = function()
  require('config.defaults')
end

M.load_commands = function()
  require('config.commands')
end

M.load_mappings = function()
  require('config.mappings')
end

M.load_plugins = function()
  require('config.plugins')
end

M.load_theme = function()
  require('config.theme')
end

return M
