local M = {}

function hasModule(module)
  local function requiref(module)
    return true
  end

  res = pcall(requiref, module)

  if not(res) then
    return false
  end

  return true
end

function install_packer()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.api.nvim_command("packadd packer.nvim")
  end

  vim.cmd('packadd packer.nvim')
end

-- load packer plugins
function setup_packer()
  local packer = require("packer")
  local util = require("packer.util")

  packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
  })
end

-- install packer if not exists
M.ensure_packer = function()
  local hasPacker,packer = pcall(require, "packer")

  if not(hasPacker) then
    install_packer()
  end

  setup_packer()
end

M.load_plugins = function()
  require("plugins/plugins")
end

return M
