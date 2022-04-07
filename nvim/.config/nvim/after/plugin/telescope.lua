local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "telescope.lua")
	return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "  ",
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
			},
		},
		preview = {
			-- filesize_hook = function(filepath, bufnr, opts)
			-- 	local max_bytes = 10000
			-- 	local cmd = { "head", "-c", max_bytes, filepath }
			-- 	require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
			-- end,
			filesize_hook = function(filepath, bufnr, opts)
				local path = require("plenary.path"):new(filepath)
				-- opts exposes winid
				local height = vim.api.nvim_win_get_height(opts.winid)
				local lines = vim.split(path:head(height), "[\r]?\n")
				vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
			end,
			timeout_hook = function(filepath, bufnr, opts)
				local cmd = { "echo", "timeout" }
				require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
			end,
		},
		file_ignore_patterns = {
			"^%.lint%-todo/",
			"^%.git/",
			"^recordings/",
			"^node_modules/",
			"^bower_components/",
		},
		mappings = {
			-- Mapping <Esc> to quit in insert mode
			i = {
				["<esc>"] = actions.close,
				["<C-h>"] = "which_key",
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<C-h>"] = "which_key",
				["<c-t>"] = trouble.open_with_trouble,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--glob",
				"!.git/*",
				"--glob",
				"!.lint-todo/*",
				"--glob",
				"!recs/*",
				"--glob",
				"!recordings/*",
				"--glob",
				"!node_modules/*",
				"--glob",
				"!bower_components/*",
				"--follow",
			},
		},
		buffers = {
			sort_lastused = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("fzf")

-- Mappings
local opts = { noremap = true, silent = true }

-- Files
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope buffers<CR>", opts)
-- Files
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope file_browser<CR>", opts)
-- Git
vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>Telescope git_branches<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gx", "<cmd>Telescope git_commits<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gy", "<cmd>Telescope git_bcommits<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gz", "<cmd>Telescope git_status<CR>", opts)
-- Git
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>Telescope commands<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>Telescope filetypes<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lk", "<cmd>Telescope keymaps<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lm", "<cmd>Telescope marks<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>Telescope pickers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lq", "<cmd>Telescope quickfix<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lt", "<cmd>Telescope tags<CR>", opts)
-- Code
vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>Telescope treesitter<CR>", opts)
-- Config
vim.api.nvim_set_keymap("n", "<leader>vc", "<cmd>Telescope colorscheme<CR>", opts)
