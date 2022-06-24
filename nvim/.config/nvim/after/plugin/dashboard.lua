local status_ok, dashboard = pcall(require, "dashboard")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "aerial.lua")
	return
end

local home = os.getenv('HOME')

dashboard.custom_center = {
	{
		icon = "  ",
		desc = "Recently laset session                  ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		aciton = "DashboardFindWord",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Open Personal dotfiles                  ",
		action = "Telescope dotfiles path=" .. home .. "/dotfiles",
		shortcut = "SPC f d",
	},
}

local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
dashboard.custom_header = {
  "",
  "",
	"          ▀████▀▄▄              ▄█",
	"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█",
	"    ▄        █          ▀▀▀▀▄  ▄▀",
	"   ▄▀ ▀▄      ▀▄              ▀▄▀",
	"  ▄▀    █     █▀   ▄█▀▄      ▄█",
	"  ▀▄     ▀▄  █     ▀██▀     ██▄█",
	"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █",
	"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀",
	"   █   █  █      ▄▄           ▄▀",
  "",
  "",
}

dashboard.custom_footer = {
	"   ",
}

-- Mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>Df", "<cmd>DashboardFindFile<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>Dh", "<cmd>DashboardFindHistory<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>Dj", "<cmd>DashboardJumpMark<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>Dl", "<cmd>SessionLoad<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>Dn", "<cmd>DashboardNewFile<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>Ds", "<cmd>SessionSave<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>Dw", "<cmd>DashboardFindWord<cr>", opts)

-- Force Pikachu color to yellow
vim.cmd([[
augroup pikachu_color
  autocmd FileType dashboard highlight DashboardHeader ctermfg=3 guifg=#f6cf57
augroup END
]])
