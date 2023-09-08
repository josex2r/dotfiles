return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    -- opts = {
    --   integrations = {
    --     alpha = true,
    --     cmp = true,
    --     gitsigns = true,
    --     illuminate = true,
    --     indent_blankline = { enabled = true },
    --     lsp_trouble = true,
    --     mason = true,
    --     mini = true,
    --     native_lsp = {
    --       enabled = true,
    --       underlines = {
    --         errors = { "undercurl" },
    --         hints = { "undercurl" },
    --         warnings = { "undercurl" },
    --         information = { "undercurl" },
    --       },
    --     },
    --     navic = { enabled = true, custom_bg = "lualine" },
    --     neotest = true,
    --     noice = true,
    --     notify = true,
    --     neotree = true,
    --     semantic_tokens = true,
    --     telescope = true,
    --     treesitter = true,
    --     which_key = true,
    --   },
    -- },
    -- config = function()
    --   require('catppuccin').setup({
    --     flavour = "macchiato",
    --   })
    --
    --   vim.cmd([[colorscheme catppuccin-macchiato]])
    -- end,
  },

  {
    "folke/tokyonight.nvim",
    config = true,
    priority = 1000,
    lazy = false,
    init = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  {
    "navarasu/onedark.nvim",
    lazy = false,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
  },
}
