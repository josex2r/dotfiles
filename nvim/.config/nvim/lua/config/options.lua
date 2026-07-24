-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.conceallevel = 0 -- 0 disables concealing; set to 3 to hide * markup for bold/italic
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.relativenumber = false -- Relative line numbers
opt.spelllang = { "en_us", "es_es" }

-- Remove root detection by LSP
-- vim.g.root_spec = { { ".git", "lua" }, "cwd" }

-- Lazyvim
-- vim.g.lazyvim_blink_main = true
-- vim.g.ai_cmp = false
-- vim.g.lazyvim_ts_lsp = "tsgo"
