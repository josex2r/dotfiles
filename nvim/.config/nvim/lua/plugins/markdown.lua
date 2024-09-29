return {
  -- https://github.com/lukas-reineke/headlines.nvim/issues/41
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      markdown = {
        fat_headline_lower_string = "▔",
      },
    },
  },
}
