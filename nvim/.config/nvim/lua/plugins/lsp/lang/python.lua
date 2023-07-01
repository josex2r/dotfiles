return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          filetypes_exclude = { "markdown" },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.pyright")
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
      },
    },
  },

  -- Python lang improvements
  "Vimjas/vim-python-pep8-indent",

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
}
