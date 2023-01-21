return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		--   require('catppuccin').setup({
		--     flavour = "macchiato",
		--   })
		--
		--   vim.cmd([[colorscheme catppuccin-macchiato]])
		-- end,
	},

	{
		"folke/tokyonight.nvim",
		config = true,
		priority = 1000,
		lazy = false,
		init = function()
			vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},

	{
		"navarasu/onedark.nvim",
		lazy = false,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
	},
}
