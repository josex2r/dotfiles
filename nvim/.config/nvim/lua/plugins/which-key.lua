return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader><leader>"] = { name = "Prev buffer" },
      },
    },
  },
}
