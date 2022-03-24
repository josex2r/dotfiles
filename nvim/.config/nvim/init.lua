
-- Try to call the cache plugin
pcall(require, "impatient")

local config = require("config")
local theme = require("theme")

-- Load config
config.load_vim_config()
config.load_mappings()
config.load_plugins()
config.load_commands()
theme.setup()
theme.load_theme("nightfox")

require("lsp")
