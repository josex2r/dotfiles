return {
  -- tools
  {
    "williamboman/mason.nvim",

    ensure_installed = {
      "prettier",
      "stylua",
      "luacheck",
      "eslint",
      "shellcheck",
      "black",
      "isort",
      "flake8",
      "deno",
      "sumneko_lua",
      "pyright",
      "jsonls",
      "bashls",
      "cssls",
      "html",
      "yamlls",
    },

    config = true,

    keys = {
      { "<leader>vm", "<cmd>Mason<cr>", desc = "Mason (plugins)" },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",

    config = true,
  },

  -- json schemas
  "b0o/SchemaStore.nvim",

  -- lsp servers
  "neovim/nvim-lspconfig",

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      -- Snippets
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      -- Completion sources
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
      -- LSP icons
      "onsails/lspkind-nvim",
    },

    config = function()
      local cmp = require('cmp')

      require("luasnip/loaders/from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          -- conflict with vim-visual-multi
          -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Tab>"] = cmp.mapping.complete(),
          ["<C-z>"] = cmp.mapping.complete(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.close()
            else
              -- Continue doing what this key does
              fallback()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            -- Go to next item if cmp is visible
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              if keymap.check_backspace() then
                fallback()
                -- Otherwise open cmp
              else
                cmp.complete()
              end
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "luasnip", priority = 9999 },
          { name = "path" },
          { name = "treesitter" },
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        formatting = {
          format = require("lspkind").cmp_format({
            with_text = true,
            maxwidth = 150,
            menu = {
              nvim_lsp = "[ LSP]",
              nvim_lua = "[ Lua]",
              buffer = "[﬘ Buf]",
              luasnip = "[ LSnip]",
              path = "[ Path]",
              cmdline = "[ CMD]",
            },
          }),
        },
      })
    end,
  },

  -- typescript
  "jose-elias-alvarez/typescript.nvim",

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          -- formatting
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black.with({
            args = { "--config", "pyproject.toml", "$FILENAME", "--quiet" },
          }),
          --diagnostics
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.pydocstyle,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.markdownlint,
          -- code action
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.eslint,
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
  },

  -- Show function signature when you type
  {
    "ray-x/lsp_signature.nvim",

    init = function()
      vim.g.navic_silence = true

      require("lazyvim.util").on_attach(function(client, buffer)
        require("lsp_signature").on_attach({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = float_config,
          hi_parameter = "ModeMsg",
        }, buffer)
      end)
    end,

    config = true,
  },

   -- LSP inline hints
  {
    "lvimuser/lsp-inlayhints.nvim",

    init = function()
      vim.g.navic_silence = true

      require("lazyvim.util").on_attach(function(client, buffer)
        require("lsp-inlayhints").on_attach(client, buffer, false)
      end)
    end,

    config = true,
  },

  -- Summekolua LSP lang completion
  "ii14/emmylua-nvim",

  -- Python lang improvements
  "Vimjas/vim-python-pep8-indent",
}
