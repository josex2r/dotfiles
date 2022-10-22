--[[ local status_ok, noice = pcall(require, "noice") ]]
--[[]]
--[[ if not status_ok then ]]
--[[ 	require("utils.debug").log.error("Couldn't load plugin", "noice.lua") ]]
--[[ 	return ]]
--[[ end ]]

require("noice").setup({
  popupmenu = {
    enabled = false, -- enables the Noice popupmenu UI
  },
	cmdline = {
		enabled = false, -- enables the Noice cmdline UI
		view = "cmdline",
		opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
		format = {
			cmdline = { pattern = "^:", icon = " " },
			search_down = { kind = "search", pattern = "^/", icon = "🔎 ", ft = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "🔎 ", ft = "regex" },
			filter = { pattern = "^:%s*!", icon = " ", ft = "sh" },
			lua = { pattern = "^:%s*lua%s+", icon = "", ft = "lua" },
		},
	},
	routes = {
		{
			filter = {
				event = "cmdline",
				find = "^%s*[/?]",
			},
			view = "cmdline",
		},
	},
})

require("telescope").load_extension("noice")
