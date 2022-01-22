local packer = require("packer")
local M = {}

local startup_plugins = function(use)
	-- lua utilities
	use("nvim-lua/plenary.nvim")

	-- Colorscheme
	use("navarasu/onedark.nvim")
	use("catppuccin/nvim")

	-- UI
	use("kyazdani42/nvim-web-devicons")
	use("glepnir/dashboard-nvim") -- NeoVim init screen
	use("norcalli/nvim-colorizer.lua") -- Colorize hex colors in buffers
	use("kevinhwang91/nvim-hlslens") -- Info about current search in virtual text
	use("stevearc/dressing.nvim") -- UI components
	use("p00f/nvim-ts-rainbow") -- Colorize brackets
	-- Statusbar
	use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

	-- Navigation
	use("petertriho/nvim-scrollbar") -- Scrollbar
	use("christoomey/vim-tmux-navigator") -- Move cursor between panes
	use("nvim-telescope/telescope.nvim") -- Fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Use FZF algorithm
	use("folke/which-key.nvim") -- Displays a popup with possible key bindings of the command you started typing
	use("nacro90/numb.nvim") -- Peeks lines of the buffer in non-obtrusive way.
	use({ "phaazon/hop.nvim", as = "hop" }) -- Jump anywhere in a document with as few keystrokes as possible
	use("ggandor/lightspeed.nvim") -- Use "s <char>" to move cursor
	use("andymass/vim-matchup") -- Navigate, and operate on sets of matching text
	use("stevearc/aerial.nvim") -- Move using Treesitter symbols

	-- Syntax highlighting
	use("joukevandermaas/vim-ember-hbs")
	use("Quramy/vim-js-pretty-template")
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Fix comments when multiple langs exists on same file
	use("ray-x/lsp_signature.nvim") -- Show function signature when you type

	-- Language Tools
	use("sukima/vim-javascript-imports") -- Import JS files + ember

	-- Debugging
	use("mfussenegger/nvim-dap") -- Inspect variables in vim
	use("mfussenegger/nvim-dap-python") -- Python inspect config
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) -- UI for DAP
	use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } }) -- UI for virtualtext
	use("nvim-telescope/telescope-dap.nvim") -- DAP for telescope

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
	})
	use("onsails/lspkind-nvim")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("github/copilot.vim")
	use("b0o/schemastore.nvim") -- JSON schemas for "jsonls" LSP

	-- Git
	use("tpope/vim-fugitive") -- Git commands
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("rhysd/conflict-marker.vim") -- Mappings for conflicts

	-- Misc
	use("editorconfig/editorconfig-vim") -- Read ".editorconfig" file
	use("tpope/vim-repeat") -- Repeat everything using "."
	use("fcpg/vim-altscreen") -- Clean terminal when running a vim shell commands
	use("junegunn/vim-easy-align") -- Align text
	use({ "windwp/nvim-spectre", requires = { "nvim-lua/plenary.nvim" } }) -- A search panel for neovim.
	use({ "VonHeikemen/searchbox.nvim", requires = { "MunifTanjim/nui.nvim" } }) -- Searchbox
	use("windwp/nvim-autopairs") -- Auto close char groups

	-- Parens, Brackets, etc...
	use("tpope/vim-commentary") -- comments using "gcc"
	use("tpope/vim-surround") -- add/delete/replace surroundings of a sandwiched textobject
	use("kshenoy/vim-signature") -- Show marks
end

M.load_plugins = function(should_sync)
	packer.startup(function(use)
		startup_plugins(use)

		if should_sync then
			packer.sync()
		end
	end)
end

return M
