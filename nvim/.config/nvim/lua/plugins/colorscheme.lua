return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
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
    lazy = false,
  },

  {
    "navarasu/onedark.nvim",
    lazy = false,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
  },
}
