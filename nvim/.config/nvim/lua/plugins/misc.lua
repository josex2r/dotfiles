return {
	-- Read ".editorconfig" file
	"gpanders/editorconfig.nvim",

	-- Repeat everything using "."
	{ "tpope/vim-repeat", event = "VeryLazy" },

	-- A search panel for neovim.
	{
		"windwp/nvim-spectre",

		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		keys = {
			{
				"<leader>sf",
				"<cmd>lua require('spectre').open_file_search()<cr>",
				desc = "Search in file",
			},
			{
				"<leader>sF",
				"<cmd>lua require('spectre').open_visual({ select_word=true })",
				desc = "Search current word",
			},
		},

		config = {
			highlight = {
				search = "Exception",
				replace = "Identifier",
			},
		},
	},

	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",

		config = {
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
		},

		init = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
		end,
	},

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

	-- buffer remove
	{
		"echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
	},
}
