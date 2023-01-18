return {
  -- common ui components
  { "stevearc/dressing.nvim", config = true },

  -- improved hls search using virtual line
  { "kevinhwang91/nvim-hlslens", config = true },

  -- tab like bufferline
  {
    "akinsho/bufferline.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = {
      options = {
        always_show_bufferline = true,
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",

    event = "BufReadPost",

    config = {
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

  -- noice
  {
    "folke/noice.nvim",

    enabled = false,
  }
}
