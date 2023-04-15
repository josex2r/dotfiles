return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",

    event = "BufReadPre",

    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        icons = require("config.icons").diagnostics,
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        -- virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        float = {
          focusable = false,
          header = "",
          source = "always",
          border = "rounded",
          prefix = "",
          width = 80,
        },
      },
      autoformat = true,
    },
    ---@param opts PluginLspOpts
    config = function(plugin, opts)
      -- setup autoformat
      require("plugins.lsp.format").autoformat = opts.autoformat

      -- setup formatting and keymaps
      require("lazyvim.util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      require("plugins.lsp.diagnostics").setup(opts.diagnostics)
      require("plugins.lsp.diagnostics").enableFloatingWindow(opts.diagnostics)

      local servers = require("plugins.lsp.servers")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        -- if opts.setup[server] then
        --   if opts.setup[server](server, server_opts) then
        --     return
        --   end
        -- elseif opts.setup["*"] then
        --   if opts.setup["*"](server, server_opts) then
        --     return
        --   end
        -- end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available thourgh mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed })
        mlsp.setup_handlers({ setup })
      end
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",

    cmd = "Mason",

    keys = {
      { "<leader>vm", "<cmd>Mason<cr>", desc = "Mason" },
    },

    config = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "prettier",
        "eslint-lsp",
        "stylua",
        "luacheck",
        "black",
        "isort",
        "flake8",
        "deno",
        "pyright",
        "jsonls",
        "bashls",
        "cssls",
        "html",
        "yamlls",
      },
    },
  },

  -- typescript
  {
    "jose-elias-alvarez/typescript.nvim",

    dependencies = {
      "neovim/nvim-lspconfig",
    },

    config = function()
      local lspconfig = require("lspconfig")

      require("typescript").setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false, -- enable debug logging for commands
        go_to_source_definition = {
          fallback = true, -- fall back to standard LSP definition on failure
        },
        -- server = { -- pass options to lspconfig's setup method
        -- 	root_dir = lspconfig.util.root_pattern("package.json"),
        -- },
      })
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",

    event = "BufReadPre",

    dependencies = { "mason.nvim" },

    opts = function()
      local null_ls = require("null-ls")

      return {
        debounce = 150,
        timeout_ms = 10000,
        debug = true,
        sources = {
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.formatting.eslint,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.isort.with({
            args = { "--stdout", "--profile", "black", "--filename", "$FILENAME", "-" },
          }),
          -- null_ls.builtins.formatting.flake8,
          null_ls.builtins.formatting.black.with({
            args = { "--config", "pyproject.toml", "$FILENAME", "--quiet" },
          }),
          --diagnostics
          -- null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.pydocstyle,
          null_ls.builtins.diagnostics.markdownlint,
          -- code action
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.eslint,
          require("typescript.extensions.null-ls.code-actions"),
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      }
    end,
  },

  -- Summekolua LSP lang completion
  "ii14/emmylua-nvim",

  -- Python lang improvements
  "Vimjas/vim-python-pep8-indent",

  -- json schema
  "b0o/SchemaStore.nvim",
}
