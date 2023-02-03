return {
	-- Read ".editorconfig" file
	"gpanders/editorconfig.nvim",

	-- Repeat everything using "."
	{ "tpope/vim-repeat", event = "VeryLazy" },

	-- Better Quick Fix window
	"kevinhwang91/nvim-bqf",

	{
		"simrat39/symbols-outline.nvim",

		keys = {
			{ "<leader>ca", "<cmd>SymbolsOutline<cr>", desc = "LSP Symbols" },
		},

		config = {
			highlight_hovered_item = true,
			show_guides = true,
			auto_preview = true,
			position = "right",
			relative_width = true,
			width = 25,
			auto_close = false,
			show_numbers = false,
			show_relative_numbers = false,
			show_symbol_details = true,
			preview_bg_highlight = "Pmenu",
			keymaps = { -- These keymaps can be a string or a table for multiple keys
				close = { "<Esc>", "q" },
				goto_location = "<Cr>",
				focus_location = "o",
				hover_symbol = "<C-space>",
				toggle_preview = "K",
				rename_symbol = "r",
				code_actions = "a",
			},
			lsp_blacklist = {},
			symbol_blacklist = {},
			symbols = require("config.icons").kind,
		},
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },
}
