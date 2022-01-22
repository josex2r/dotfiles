local load_plugins = require("plugins/plugins").load_plugins
local M = {}

local function setup_packer()
	local packer = require("packer")
	local util = require("packer.util")

	-- Setup download dir: ~/.local/share/nvim/site/pack/packer/start
	packer.init({
		package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
	})

	-- Compile Packer on "plugins.lua" change
	vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
end

local function install_packer()
	local should_sync = false
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		should_sync = true
	end

	return should_sync
end

M.init = function()
	local should_sync = install_packer()

	setup_packer()

	load_plugins()

	if should_sync then
		require("packer").sync()
	end
end

return M
