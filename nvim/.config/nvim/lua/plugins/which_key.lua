return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	config = {
		layout = {
			height = { min = 4, max = 15 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		plugins = { spelling = true },
	},

	init = function()
		local wk = require("which-key")

		wk.register({
			mode = { "n", "v" },
			["g"] = { name = "+goto" },
			["gz"] = { name = "+surround" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader><tab>"] = { name = "+tabs" },
			b = "+buffer",
			c = "+coding",
			f = "+files",
			g = "+git",
			h = "+harpoon",
			n = { name = ":noh", cmd = "<cmd>noh<cr>" },
			P = "Buffer picker",
			q = "+quickfix",
			s = "+search",
			u = "+toggle config",
			v = "+vim Config",
			w = { "Save File" },
			x = "+diagnostics",
			z = "+dap (debug)",
			["<space>"] = "Go to prev Buffer",
		}, { prefix = "<leader>" })
	end,
}
