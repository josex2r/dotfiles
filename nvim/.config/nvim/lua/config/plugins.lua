local custom_packer = require("utils.packer")
local status_ok, packer = pcall(require, "packer")

if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	package_root = custom_packer.package_root,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	keys = {},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("lewis6991/impatient.nvim")

	-- Colorscheme
	use("navarasu/onedark.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("EdenEast/nightfox.nvim")

	-- UI (IDE style)
	use("kyazdani42/nvim-web-devicons") -- Web devicons
	use("glepnir/dashboard-nvim") -- NeoVim init screen
	use("norcalli/nvim-colorizer.lua") -- Colorize hex colors in buffers
	use("kevinhwang91/nvim-hlslens") -- Info about current search in virtual text
	use("stevearc/dressing.nvim") -- UI components
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}) -- Buffer TabBar
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) -- Statusbar
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) -- Tree view
	use("petertriho/nvim-scrollbar") -- Scrollbar
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	}) -- Folds
	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		},
	}) -- Experimental CMD view

	-- Terminal navigation
	-- use("christoomey/vim-tmux-navigator") -- Move cursor between panes
	use("knubie/vim-kitty-navigator") -- Move cursor between panes

	-- Navigation
	use("nvim-telescope/telescope.nvim") -- Fuzzy finder
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	}) -- Use FZF algorithm
	use("folke/which-key.nvim") -- Displays a popup with possible key bindings of the command you started typing
	use("nacro90/numb.nvim") -- Peeks lines of the buffer in non-obtrusive way.
	-- use("ggandor/lightspeed.nvim") -- Use "s <char>" to move cursor
	use("ggandor/leap.nvim") -- Use "s <char>" to move cursor
	use("simrat39/symbols-outline.nvim") -- A tree like view for symbols that uses LSP

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}) -- Navigate diagnostics
	use("folke/todo-comments.nvim") -- Navigate TODO comments

	-- Syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}) -- Treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Fix comments when multiple langs exists on same file
	use("p00f/nvim-ts-rainbow") -- Colorize brackets
	use("fladson/vim-kitty")

	-- Debugging
	use("mfussenegger/nvim-dap") -- Inspect variables in vim
	use("mfussenegger/nvim-dap-python") -- Python inspect config
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	}) -- UI for DAP
	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" },
	}) -- UI for virtualtext
	use("nvim-telescope/telescope-dap.nvim") -- DAP for telescope

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- LSP
		"williamboman/mason.nvim", -- LSP server install commands
		"williamboman/mason-lspconfig.nvim", -- LSP server install commands
	})
	use("onsails/lspkind-nvim") -- Adds vscode-like pictograms to neovim built-in lsp
	use({
		"hrsh7th/nvim-cmp", -- Autocomplete
		requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use({ "jose-elias-alvarez/typescript.nvim" }) -- typescript LSP
	-- use({ "jose-elias-alvarez/nvim-lsp-ts-utils" }) -- Null_LS config for TypeScript
	use("b0o/schemastore.nvim") -- JSON schemas for "jsonls" LSP
	use("ray-x/lsp_signature.nvim") -- Show function signature when you type
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("lvimuser/lsp-inlayhints.nvim") -- LSP inline hints
	use("ii14/emmylua-nvim") -- Summekolua LSP lang completion

	-- Git
	use("tpope/vim-fugitive") -- Git commands
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Misc
	use("gpanders/editorconfig.nvim") -- Read ".editorconfig" file
	use("tpope/vim-repeat") -- Repeat everything using "."
	use("fcpg/vim-altscreen") -- Clean terminal when running a vim shell commands
	use({
		"windwp/nvim-spectre",
		requires = { "nvim-lua/plenary.nvim" },
	}) -- A search panel for neovim.
	use("windwp/nvim-autopairs") -- Auto close char groups
	use("lukas-reineke/indent-blankline.nvim") -- Indentation guides
	use("dstein64/vim-startuptime") -- Show startup time graph when running nvim with "--startuptime" and ":StartupTime"
	use("kevinhwang91/nvim-bqf") -- Better Quick Fix window
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- Parens, Brackets, etc...
	use("numToStr/Comment.nvim") -- comments using "gcc"
	use("tpope/vim-surround") -- add/delete/replace surroundings of a sandwiched textobject
	use("kshenoy/vim-signature") -- Toggle/Show marks in tabline
	use("mg979/vim-visual-multi") -- Multiple cursor like VS Code
	use("ThePrimeagen/harpoon") -- Marks in files, lines, ...

	-- Python
	use("Vimjas/vim-python-pep8-indent")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
