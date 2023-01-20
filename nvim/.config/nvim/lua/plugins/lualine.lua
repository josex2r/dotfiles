local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = false,
	symbols = require("config.icons").git,
	cond = hide_in_width,
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)

	return chars[index]
end

local disabled_filetypes = vim.o.laststatus == 3 and {} or { "dashboard", "NvimTree", "Outline" }

return {
	{
		"nvim-lualine/lualine.nvim",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local navic = require("nvim-navic")
			local lualine = require("lualine")

			lualine.setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = disabled_filetypes,
					globalstatus = vim.o.laststatus == 3,
					path = 1,
					file_status = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						-- 'branch',
						diff,
						diagnostics,
					},
					lualine_c = {
						"filename",
						{ navic.get_location, cond = navic.is_available },
					},
					-- lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_x = { "filetype" },
					lualine_y = { progress },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})
		end,
	},

	-- lsp symbol navigation for lualine
	{
		"SmiteshP/nvim-navic",

		init = function()
			vim.g.navic_silence = true

			require("lazyvim.util").on_attach(function(client, buffer)
				require("nvim-navic").attach(client, buffer)
			end)
		end,

		config = { separator = " ", highlight = true, depth_limit = 5 },
	},
}
