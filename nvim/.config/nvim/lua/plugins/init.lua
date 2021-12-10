local M = {}
-- load packer plugins
local function setup_packer()
  local packer = require("packer")
  local util = require("packer.util")

  packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
  })
end

local function install_packer()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.api.nvim_command("packadd packer.nvim")
  end

  vim.cmd('packadd packer.nvim')
end

-- install packer if not exists
M.ensure_packer = function()
  local hasPacker, packer = pcall(require, "packer")

  if not(hasPacker) then
    install_packer()
  end

  setup_packer()
end

M.load_plugins = function()
  require("plugins/plugins")
end

M.init = function()
  M.ensure_packer()

  -- Impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your init.vim.
  require('impatient')

  M.load_plugins()
end

return M
