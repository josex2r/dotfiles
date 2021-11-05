local plugins = require("plugins")

plugins.ensure_packer()

-- Impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your init.vim.
require('impatient')

plugins.load_plugins()

-- Load config directory
require("config/defaults").init()
require("config/mappings").init()
require("config/theme").init()

vim.cmd [[
    runtime! config/commands.vim
    runtime! config/mappings.vim
]]
