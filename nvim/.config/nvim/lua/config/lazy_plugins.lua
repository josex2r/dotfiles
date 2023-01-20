local constants = require("constants")

local lazypath = constants.lazy_path

if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		-- import LazyVim plugins
		-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- import/override with your plugins
		{ import = "plugins" },
	},
	defaults = {
		-- lazy = true, -- every plugin is lazy-loaded by default
		version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = {
		colorscheme = { "tokyonight-moon" },
	},
	diff = {
		cmd = "terminal_git",
	},
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		-- cache = {
		--   enabled = true,
		-- },
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.keymap.set("n", "<leader>vl", "<cmd>:Lazy<cr>")
