return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = "macchiato",
      })

      vim.cmd([[colorscheme catppuccin-macchiato]])
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
}
