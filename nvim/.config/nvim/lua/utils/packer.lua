local fn = vim.fn
local fs = require('utils.fs')
local nvim = require('utils.nvim')
local debug = require('utils.debug')

local M = {}

-- Packer root directory
local package_root = fs.join_paths(nvim.get_runtime_dir(), "site", "pack")

-- Packer installation directory
local install_path = fs.join_paths(package_root, "packer", "start", "packer.nvim")

M.package_root = package_root

M.install_path = install_path

--- Downloads and installs Packer
--@param path (string) path to check
function M.download_and_install(path)
  PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		path,
	})

	debug.log.info("Installing packer close and reopen Neovim to apply changes...")

  vim.cmd([[packadd packer.nvim]])
end

-- Automatically install packer
function M.check_and_install()
  if fs.is_directory_empty(M.install_path) then
    M.download_and_install(M.install_path)
  end
end

return M
