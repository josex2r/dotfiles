local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
local M = {}

M.setup = function(server, opts)
  return opts
end

M.config = {
  debug = true,
  debounce = 250,
  sources = {
    null_ls.builtins.code_actions.refactoring,

    -- ---------------
    -- -  formating  -
    -- ---------------
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
      filetypes = { "html", "json", "yaml", "markdown", "handlebars" },
    }),
    null_ls.builtins.formatting.stylua,

    -- ---------------
    -- - diagnostics -
    -- ---------------
    null_ls.builtins.diagnostics.write_good,
    -- null_ls.builtins.diagnostics.eslint_d.with({
    --   prefer_local = "node_modules/.bin",
    --   cwd = function(params)
    --     return require("lspconfig")["tsserver"].get_root_dir(params.bufname)
    --   end,
    -- }),

    -- ---------------
    -- - code action -
    -- ---------------
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.eslint_d.with({
      prefer_local = "node_modules/.bin",
      cwd = function(params)
        return lspconfig["tsserver"].get_root_dir(params.bufname)
      end,
    }),
  }
}

return M
