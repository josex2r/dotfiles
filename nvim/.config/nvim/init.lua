-- Try to call the cache plugin
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

local config = require("config")
local theme = require("theme")
local custom_packer = require('utils.packer')

-- Automatically install packer
custom_packer.check_and_install()

-- Load config
config.load_vim_config()
config.load_mappings()
config.load_plugins()
config.load_commands()
theme.setup()
theme.load_theme("catppuccin")

require("lsp")
