local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = "maintained",
	incremental_selection = { enable = true },
  autopairs = {
    enable = true,
  },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
    disable = { "python" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {
			"#cc241d",
			"#b16286",
			"#d79921",
			"#689d6a",
			"#d65d0e",
			"#458588",
		},
	},
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		include_match_words = true,
		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
	},
	context_commentstring = {
		enable = true,
	},
})
