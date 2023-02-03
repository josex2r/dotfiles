return {
	{ "folke/lazy.nvim", version = "*" },

	{
		"LazyVim/LazyVim",
		priority = 10000,
		lazy = false,
		config = true,
		version = "*",
		opts = {
			colorscheme = "tokyonight-moon",
		},
	},

	{
		"nvim-lua/plenary.nvim",
	},

	-- measure startuptime
	{
		"dstein64/vim-startuptime",

		cmd = "StartupTime",

		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
}
