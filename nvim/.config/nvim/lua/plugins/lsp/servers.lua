local lspconfig = require("lspconfig")

local M = {}

M.lua_ls = {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

M.pyright = {}

M.jsonls = {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

M.cssls = {}

M.html = {}

M.yamlls = {
  yaml = {
    schemaStore = {
      enable = true,
    },
  },
}

M.bashls = {}

M.denols = {
  root_dir = lspconfig.util.root_pattern("deps.ts"),
}

M.terraformls = {}

return M
