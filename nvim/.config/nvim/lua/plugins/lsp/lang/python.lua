return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff_lsp = {},
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },

  -- Python lang improvements
  "Vimjas/vim-python-pep8-indent",

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "isort")
      table.insert(opts.ensure_installed, "flake8")
      table.insert(opts.ensure_installed, "black")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- table.insert(opts.sources, nls.builtins.formatting.flake8)
      table.insert(opts.sources, nls.builtins.diagnostics.pydocstyle)
      table.insert(
        opts.sources,
        nls.builtins.formatting.isort.with({
          args = { "--stdout", "--profile", "black", "--filename", "$FILENAME", "-" },
        })
      )
      table.insert(
        opts.sources,
        nls.builtins.formatting.black.with({
          args = { "--config", "pyproject.toml", "$FILENAME", "--quiet" },
        })
      )
    end,
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },

  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {},
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
