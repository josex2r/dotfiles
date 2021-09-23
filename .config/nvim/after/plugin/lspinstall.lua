local function make_config2()



-- vim.lsp.set_log_level("debug")
-- needs https://github.com/microsoft/vscode-codicons/blob/master/dist/codicon.ttf
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "●" }
  })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single"
})

local icons = require("nvim-nonicons")
vim.fn.sign_define("LspDiagnosticsSignError",
                   { text = icons.get("x-circle"), texthl = "LspDiagnosticsSignError" })

vim.fn.sign_define("LspDiagnosticsSignWarning",
                   { text = icons.get("alert"), texthl = "LspDiagnosticsSignWarning" })

vim.fn.sign_define("LspDiagnosticsSignInformation",
                   { text = icons.get("info"), texthl = "LspDiagnosticsSignInformation" })

vim.fn.sign_define("LspDiagnosticsSignHint",
                   { text = icons.get("comment"), texthl = "LspDiagnosticsSignHint" })

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";"),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      },
    },
  },
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  return {
    -- enable snippet support
    capabilities = capabilities,
  }
end

local function setup_servers()
  require"lspinstall".setup()

  -- get all installed servers
  local servers = require"lspinstall".installed_servers()
  -- ... and add manually installed servers
  -- table.insert(servers, "sourcekit")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
      config.root_dir = function(fname)
        if fname:match("lush_theme") ~= nil then return nil end
        local util = require "lspconfig/util"
        return util.find_git_ancestor(fname) or util.path.dirname(fname)
      end
    end

    if server == "sourcekit" then
      config.filetypes = { "swift", "objective-c", "objective-cpp" } -- we don't want c and cpp!
    end

    if server == "clangd" then
      config.filetypes = { "c", "cpp" } -- we don't want objective-c and objective-cpp!
    end

    if server == "efm" then config = vim.tbl_extend("force", config, require "efm") end

    if server == "diagnosticls" then
      config = vim.tbl_extend("force", config, require "diagnosticls")
    end

    if server == "tailwindcss" then
      config.settings = {
        tailwindCSS = {
          -- NOTE: values for `validate` and `lint.cssConflict` are required by the server
          validate = true,
          lint = { cssConflict = "warning" },
        },
      }
      config.on_new_config = function(new_config)
        new_config.settings.editor = {
          -- optional, for hover code indentation
          tabSize = vim.lsp.util.get_effective_tabstop(),
        }
      end
    end

    if server == "vim" then config.init_options = { isNeovim = true } end

    require"lspconfig"[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require"lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'spell' },
    { name = 'emoji' },
    -- { name = 'luasnip' },
    { name = 'buffer' },
  },
  documentation = {
    border = "single",
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })[entry.source.name]
      return vim_item
    end,
  },
})






end
