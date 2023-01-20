return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",

		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},

		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},

		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1)
							and vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-next", true, true, true),
								""
							)
						or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-next", true, true, true), "")
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				end,
				mode = { "i", "s" },
			},
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",

		dependencies = {
			-- Snippets
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
			-- Completion sources
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			-- LSP icons
			"onsails/lspkind-nvim",
		},

		config = function()
			local cmp = require("cmp")

			require("luasnip/loaders/from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completeopt = "menu,menuone,noinsert",
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					-- conflict with vim-visual-multi
					-- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					-- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Tab>"] = cmp.mapping.complete(),
					["<C-x>"] = cmp.mapping.complete(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = require("lspkind").cmp_format({
						with_text = true,
						maxwidth = 150,
						menu = require("config.icons").lsp,
					}),
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			})
		end,
	},

	-- json schemas
	"b0o/SchemaStore.nvim",

	-- Show function signature when you type
	{
		"ray-x/lsp_signature.nvim",

		init = function()
			vim.g.navic_silence = true

			require("lazyvim.util").on_attach(function(client, buffer)
				require("lsp_signature").on_attach({
					bind = true, -- This is mandatory, otherwise border config won't get registered.
					handler_opts = float_config,
					hi_parameter = "ModeMsg",
				}, buffer)
			end)
		end,

		config = true,
	},

	-- LSP inline hints
	{
		"lvimuser/lsp-inlayhints.nvim",

		init = function()
			vim.g.navic_silence = true

			require("lazyvim.util").on_attach(function(client, buffer)
				require("lsp-inlayhints").on_attach(client, buffer, false)
			end)
		end,

		config = true,
	},

	-- auto pairs
	{
		"windwp/nvim-autopairs",

		config = {
			-- Don't add pairs if it already has a close pair in the same line
			enable_check_bracket_line = true,
			-- will ignore alphanumeric and `.` `"` `'` symbols
			ignored_next_char = "[%w%.%'%\"]",
			-- disable in buffers of type
			disable_filetype = {
				"TelescopePrompt",
				"vim",
				"guihua",
				"guihua_rust",
				"clap_input",
				"spectre_panel",
			},
			fast_wrap = {
				map = "<C-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		},

		init = function()
			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- surround
	{
		"echasnovski/mini.surround",
		keys = function(plugin, keys)
			-- Populate the keys based on the user's options
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			local mappings = {
				{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
				{ opts.mappings.delete, desc = "Delete surrounding" },
				{ opts.mappings.find, desc = "Find right surrounding" },
				{ opts.mappings.find_left, desc = "Find left surrounding" },
				{ opts.mappings.highlight, desc = "Highlight surrounding" },
				{ opts.mappings.replace, desc = "Replace surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		},
		config = function(_, opts)
			-- use gz mappings instead of s to prevent conflict with leap
			require("mini.surround").setup(opts)
		end,
	},

	-- comments
	{
		"numToStr/Comment.nvim",

		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},

		config = function()
			require("Comment").setup({
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	-- better text-objects
	{
		"echasnovski/mini.ai",
		keys = {
			{ "a", mode = { "x", "o" } },
			{ "i", mode = { "x", "o" } },
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- no need to load the plugin, since we only need its queries
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
		config = function(_, opts)
			local ai = require("mini.ai")
			ai.setup(opts)
		end,
	},

	-- folds
	{
		"kevinhwang91/nvim-ufo",

		dependencies = {
			"kevinhwang91/promise-async",
		},

		config = {
			provider_selector = function(bufnr, filetype)
				return { "treesitter", "indent" }
			end,
		},
	},
}
