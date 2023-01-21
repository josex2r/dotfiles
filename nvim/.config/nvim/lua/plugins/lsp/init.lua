return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",

		event = "BufReadPre",

		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				icons = require("config.icons").diagnostics,
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				-- virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
				float = {
					focusable = false,
					header = "",
					source = "always",
					border = "rounded",
					prefix = "",
					width = 80,
				},
			},
			autoformat = true,
		},
		---@param opts PluginLspOpts
		config = function(plugin, opts)
			-- setup autoformat
			require("plugins.lsp.format").autoformat = opts.autoformat

			-- setup formatting and keymaps
			require("lazyvim.util").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
			end)

			-- diagnostics
			require("plugins.lsp.diagnostics").setup(opts.diagnostics)
			require("plugins.lsp.diagnostics").enableFloatingWindow(opts.diagnostics)

			local servers = require("plugins.lsp.servers")
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
			require("mason-lspconfig").setup_handlers({
				function(server)
					if servers[server] == false then
						return
					end

					local server_opts = servers[server] or {}

					server_opts.capabilities = capabilities

					require("lspconfig")[server].setup(server_opts)
				end,
			})
		end,
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",

		cmd = "Mason",

		keys = {
			{ "<leader>vm", "<cmd>Mason<cr>", desc = "Mason" },
		},

		config = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"prettier",
				"eslint",
				"stylua",
				"luacheck",
				"black",
				"isort",
				"flake8",
				"deno",
				"pyright",
				"jsonls",
				"bashls",
				"cssls",
				"html",
				"yamlls",
			},
		},
	},

	-- typescript
	{
		"jose-elias-alvarez/typescript.nvim",

		dependencies = {
			"neovim/nvim-lspconfig",
		},

		config = function()
			local lspconfig = require("lspconfig")

			require("typescript").setup({
				disable_commands = false, -- prevent the plugin from creating Vim commands
				debug = false, -- enable debug logging for commands
				server = { -- pass options to lspconfig's setup method
					root_dir = lspconfig.util.root_pattern("package.json"),
					settings = {
						typescript = {
							-- inlayHints = {
							-- 	includeInlayParameterNameHints = "all",
							-- 	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							-- 	includeInlayFunctionParameterTypeHints = true,
							-- 	includeInlayVariableTypeHints = true,
							-- 	includeInlayPropertyDeclarationTypeHints = true,
							-- 	includeInlayFunctionLikeReturnTypeHints = true,
							-- 	includeInlayEnumMemberValueHints = true,
							-- },
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
			})
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",

		event = "BufReadPre",

		dependencies = { "mason.nvim" },

		opts = function()
			local null_ls = require("null-ls")

			return {
				debounce = 150,
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.eslint,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black.with({
						args = { "--config", "pyproject.toml", "$FILENAME", "--quiet" },
					}),
					--diagnostics
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.diagnostics.pydocstyle,
					null_ls.builtins.diagnostics.markdownlint,
					-- code action
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.code_actions.eslint,
				},
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
			}
		end,
	},

	-- Summekolua LSP lang completion
	"ii14/emmylua-nvim",

	-- Python lang improvements
	"Vimjas/vim-python-pep8-indent",
}
