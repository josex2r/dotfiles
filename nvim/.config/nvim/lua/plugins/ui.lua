return {
  -- improved hls search using virtual line
  { "kevinhwang91/nvim-hlslens", config = true },

  -- completion
  -- {
  --   "nvim-cmp",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --
  --     opts.window = {
  --       completion = cmp.config.window.bordered(),
  --       documentation = cmp.config.window.bordered(),
  --     }
  --   end,
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   opts = function(_, opts)
  --     opts.windows.autocomplete.border = "padded"
  --     opts.windows.autocomplete.draw = "simple"
  --     opts.windows.autocomplete.scrollbar = true
  --
  --     opts.windows.documentation.border = "padded"
  --     opts.windows.documentation.draw = "simple"
  --     opts.windows.documentation.scrollbar = true
  --
  --     return opts
  --   end,
  -- },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",

    opts = {
      handle = {
        color = "#333840",
      },
      handlers = {
        diagnostic = true,
        search = true, -- Requires hlslens to be loaded
      },
    },

    init = function()
      require("scrollbar.handlers.search").setup()
    end,
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = false,
        lsp_doc_border = true,
      },
    },
  },
}
