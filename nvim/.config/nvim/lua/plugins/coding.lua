local lspkind_comparator = function(conf)
	local lsp_types = require("cmp.types").lsp
	return function(entry1, entry2)
		if entry1.source.name ~= "nvim_lsp" then
			if entry2.source.name == "nvim_lsp" then
				return false
			else
				return nil
			end
		end
		local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
		local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

		local priority1 = conf.kind_priority[kind1] or 0
		local priority2 = conf.kind_priority[kind2] or 0
		if priority1 == priority2 then
			return nil
		end
		return priority2 < priority1
	end
end

local label_comparator = function(entry1, entry2)
	return entry1.completion_item.label < entry2.completion_item.label
end

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
						or vim.api.nvim_replace_termcodes("<tab>", true, true, true)
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
			local luasnip = require("luasnip")

			require("luasnip/loaders/from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
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
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif require("utils.keymap").has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
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
				comparators = {
					lspkind_comparator({
						kind_priority = {
							Field = 11,
							Property = 11,
							Constant = 10,
							Enum = 10,
							EnumMember = 10,
							Event = 10,
							Function = 10,
							Method = 10,
							Operator = 10,
							Reference = 10,
							Struct = 10,
							Variable = 9,
							File = 8,
							Folder = 8,
							Class = 5,
							Color = 5,
							Module = 5,
							Keyword = 2,
							Constructor = 1,
							Interface = 1,
							Snippet = 0,
							Text = 1,
							TypeParameter = 1,
							Unit = 1,
							Value = 1,
						},
					}),
					label_comparator,
				},
			})
		end,
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
		-- keys = {
		--   { "a", mode = { "x", "o" } },
		--   { "i", mode = { "x", "o" } },
		-- },
		event = "VeryLazy",
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
