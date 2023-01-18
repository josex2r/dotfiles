local fn = vim.fn
local fs = require('utils.fs')
local nvim = require('utils.nvim')

local M = {}

-- lazy.nvim
M.lazy_path = fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Packer
M.packer_root = fs.join_paths(nvim.get_runtime_dir(), "site", "pack")
M.packer_install_path = fs.join_paths(M.packer_root, "packer", "start", "packer.nvim")

return M
