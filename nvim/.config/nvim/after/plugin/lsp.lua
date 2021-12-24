local exists, module = pcall(require, "nvim-lsp-installer")
local lsp = require("lsp")

if not exists then
  return
end

-- Debugging
-- vim.lsp.set_log_level("debug")

-- Diagnostics
vim.diagnostic.config({
  signs = {
    -- severity_limit = 'Warning',
  },
  virtual_text = {
    prefix = "●",
    spacing = 2,
    severity_limit = 'Warning',
    source = "always",
  },
})

-- Redefine diagnostics signs
vim.cmd[[
	sign define DiagnosticSignError text= texthl=DiagnosticSignError numhl=DiagnosticSignError
	sign define DiagnosticSignWarn text=  texthl=DiagnosticSignWarn numhl=DiagnosticSignWarn
	sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo numhl=DiagnosticSignInfo
	sign define DiagnosticSignHint text= texthl=DiagnosticSignHint numhl=DiagnosticSignHint
]]

-- Show diagnostics when hovering over an error
vim.cmd[[
  augroup lsp_diagnostics
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float({ focusable = false, border = "single" })
  augroup END
]]

-- Custom colors
vim.cmd [[
  augroup lsp_theme
    autocmd!
    autocmd ColorScheme * highlight LspSignatureActiveParameter gui=bold guifg=#61afef
    autocmd ColorScheme * highlight DiagnosticStrikethroughDeprecated gui=strikethrough
  augroup END
]]


-- Init "null-ls" for code formatting
local null_ls = require("null-ls")
local null_ls_config = require("lsp.servers.null_ls").config

null_ls_config.on_attach = lsp.on_attach
require("null-ls").setup(null_ls_config)

-- Common server capabilities
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Language Servers
module.on_server_ready(function(server)
  -- LSP Options: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  local opts = {
    on_attach = lsp.on_attach,
    capabilities = capabilities,
  }

  -- dinamically load config from "lua/lsp/servers"
  local server_exists, server_module = pcall(require, "lsp.servers." .. server.name)

  if (server_exists) then
    opts = server_module.setup(server, opts)
  else
    print("LSP server config not found: " .. vim.inspect(server.name))
  end

  -- setup server config
  server:setup(opts)
end)
