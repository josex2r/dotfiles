local status_ok, leap = pcall(require, "leap")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "leap.lua")
	return
end

leap.setup({
	case_insensitive = true,
	-- These keys are captured directly by the plugin at runtime.
	special_keys = {
		next_match_group = "<space>",
		prev_match_group = "<tab>",
		["repeat"] = "<enter>",
		revert = "<tab>",
	},
})

leap.set_default_keymaps()

vim.cmd([[
autocmd ColorScheme * lua require('leap').init_highlight(true)
]])
