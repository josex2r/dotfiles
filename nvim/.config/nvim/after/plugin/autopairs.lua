local status_ok, autopairs = pcall(require, "nvim-autopairs")

if not status_ok then
	return
end

autopairs.setup({
	enable_check_bracket_line = true, -- check bracket in same line
	ignored_next_char = "[%w%.%'%\"]", -- will ignore alphanumeric and `.` `"` `'` symbols
	disable_filetype = {
		"TelescopePrompt",
		"guihua",
		"guihua_rust",
		"clap_input",
		"spectre_panel",
	}, -- Natigator.lua
	fast_wrap = {
		map = "<C-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
