local Util = require("lazyvim.util")

return {
	{
		"nvim-telescope/telescope.nvim",

		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		keys = {
			{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
			{ "<leader>/", Util.telescope("live_grep"), desc = "Live grep" },
			{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },

			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>p", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			-- find
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			-- search
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
			{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
			{ "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
			{ "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
			{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
			{
				"<leader>vc",
				Util.telescope("colorscheme", { enable_preview = true }),
				desc = "Colorscheme with preview",
			},
			{
				"<leader>ss",
				Util.telescope("lsp_document_symbols", {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				}),
				desc = "Goto Symbol",
			},
		},

		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<C-i>"] = function()
							Util.telescope("find_files", { no_ignore = true })()
						end,
						["<C-h>"] = function()
							Util.telescope("find_files", { hidden = true })()
						end,
						["<C-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
					},
				},
				preview = {
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
				-- file_ignore_patterns = {
				-- 	"^%.lint%-todo/",
				-- 	"^%.git/",
				-- 	"^recordings/",
				-- 	"^node_modules/",
				-- 	"^bower_components/",
				-- },
			},
		},

		config = function(plugin, opts)
			local telescope = require("telescope")

			telescope.setup(opts)

			telescope.load_extension("fzf")
		end,
	},
}
