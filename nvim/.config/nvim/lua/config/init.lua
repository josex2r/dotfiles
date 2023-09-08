local M = {}

M.load_vim_config = function()
  require("config.defaults")
  require("config.autocmds")
end

M.load_commands = function()
  require("config.commands")
end

M.load_mappings = function()
  require("config.mappings")
end

M.load_plugins = function()
  -- require('config.plugins')
  require("config.lazy_plugins")
end

return M
