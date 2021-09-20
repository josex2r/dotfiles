local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Load config directory
vim.cmd [[
    runtime! config/*.vim
]]

-- Ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- Startup and add configure plugins
require 'plugins'
-- require 'mappings'

-- Impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your init.vim.
require('impatient')
