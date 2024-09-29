return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      on_colors = function(colors)
        -- Make inline suggestions more readable
        -- colors.terminal_black = "#68a8bc"
        colors.diff.change = colors.blue7
        colors.diff.delete = colors.red1
      end,
    },
  },
}
