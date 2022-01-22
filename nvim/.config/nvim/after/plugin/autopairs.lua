require("nvim-autopairs").setup({
	enable_check_bracket_line = false,
	ignored_next_char = "[%w%.%'%\"]", -- will ignore alphanumeric and `.` `"` `'` symbols
	-- Natigator.lua
	disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
