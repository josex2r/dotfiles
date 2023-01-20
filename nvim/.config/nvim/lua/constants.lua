local fn = vim.fn
local fs = require('utils.fs')
local nvim = require('utils.nvim')
local os = require("os")

local M = {}

-- Globals
M.home = os.getenv("HOME")

-- lazy.nvim
M.lazy_path = fn.stdpath("data") .. "/lazy/lazy.nvim"

-- DAP
M.breakpoints_dir = M.home .. "/.cache/dap"
M.breakpoints_file = "breakpoints.json"
M.breakpoints_path = M.breakpoints_dir .. "/" .. M.breakpoints_file

return M
