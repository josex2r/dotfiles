local plugins = require("plugins")
local config = require("config")

-- Load plugins
plugins.init()

-- Load config
config.load_vim_config()
config.load_mappings()
config.load_theme()

vim.cmd [[
    runtime! config/commands.vim
    runtime! config/mappings.vim
]]
