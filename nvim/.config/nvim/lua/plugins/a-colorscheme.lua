return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      on_colors = function(colors)
        -- Make inline suggestions more readable
        -- colors.terminal_black = "#68a8bc"
        colors.diff.change = colors.blue7
        colors.diff.delete = colors.red1
      end,
    },
  },

  {
    "serhez/teide.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
