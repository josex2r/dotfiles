local exists, module = pcall(require, "nvim-lsp-installer")

if not exists then
  return
end

local util = require 'lspconfig/util'

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
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false, border = "single" })
  augroup END
]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function common_on_attach(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>cd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<space>cq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Format on save
  vim.cmd[[
    augroup lsp_format
      autocmd!
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
    augroup END
  ]]

end

-- Init "null-ls" for code formatting
require("null-ls").config({})
require("lspconfig")["null-ls"].setup({ on_attach = common_on_attach })

-- Common server capabilities
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Language Servers
module.on_server_ready(function(server)
  -- LSP Options: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  local opts = {
    on_attach = common_on_attach,
    capabilities = capabilities,
  }

  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {
            vim = true,
          },
        },
      },
    }
  end

  if server.name == "eslint" then
    opts.on_attach = function (client, bufnr)
      -- Disable eslint formatting
      client.resolved_capabilities.document_formatting = false
      common_on_attach(client, bufnr)
    end
  end

  if server.name == "tsserver" then
    opts.root_dir = util.root_pattern("tsconfig.json", "jsconfig.json")
    opts.on_attach = function (client, bufnr)
      -- Disable tsserver formatting
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({
        eslint_bin = "eslint_d",
        eslint_enable_diagnostics = true,
        eslint_enable_code_actions = true,
        enable_formatting = true,
        formatter = "prettier",
      })
      ts_utils.setup_client(client)

      common_on_attach(client, bufnr)
    end
  end

  server:setup(opts)
end)
