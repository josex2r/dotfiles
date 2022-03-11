local status_ok, cmp = pcall(require, "cmp")
local utils = require("utils")

if not status_ok then
	return
end

local types = require("cmp.types")

-- Navigator.lua
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }") -- Load vscode snippets

-- Snippets
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Tab>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-k>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<Up>"] = cmp.config.disable,
		["<Down>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			elseif vim.b._copilot_suggestion then
				vim.cmd["copilot#Dismiss"]()
			end

			if not cmp.visible() then
				-- Continue doing what this key does
				fallback()
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm({
			-- behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			-- Go to next item if cmp is visible
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				if utils.keymap.check_backspace() then
					fallback()
					-- Otherwise open cmp
				else
					cmp.complete()
				end
			end
		end, { "i", "s" }),
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			end
			fallback()
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "luasnip", priority = 9999 },
		{ name = "path" },
		{ name = "treesitter" },
	}),
	documentation = {
		border = "rounded",
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			maxwidth = 50,
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[Buffer]",
				luasnip = "[Snip]",
				path = "[Path]",
				cmdline = "[CMD]",
			},
		}),
	},
})
