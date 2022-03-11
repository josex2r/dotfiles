local config = require("config")

function setup_theme()
	local theme = require("theme")

	theme.setup()
	theme.load_theme("onedark")
end

-- Load config
config.load_vim_config()
config.load_mappings()
config.load_plugins()
config.load_commands()
setup_theme()

require("lsp")
