local status_ok, indent_blankline = pcall(require, "indent_blankline")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "indent_blankline.lua")
	return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

--[[ vim.cmd "highlight IndentBlanklineContextChar guifg=#E06C75 gui=nocombine" ]]

indent_blankline.setup({
	space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
	buftype_exclude = { "terminal" },
	--[[ filetype = { ]]
	--[[ 	"javascript", ]]
	--[[ 	"typescript", ]]
	--[[ 	"python", ]]
	--[[ 	"lua", ]]
	--[[ 	"json", ]]
	--[[ 	"yaml", ]]
	--[[ 	"conf", ]]
	--[[ 	"sh", ]]
	--[[ }, ]]
	filetype_exclude = {
		"lspinfo",
		"packer",
		"checkhealth",
		"help",
		"dashboard",
		"NvimTree",
		"lsp-installer",
		"terminal",
		"TelescopePrompt",
		"TelescopeResults",
		"log",
		"fugitive",
		"gitcommit",
		"vimwiki",
		"markdown",
		"txt",
		"vista",
		"git",
		"undotree",
		"",
	},
})
