return {
  "folke/which-key.nvim",
  optional = true,
  keys = {
    { "<leader><space>", "<C-^>", desc = "Prev buffer" },
  },
  opts = {
    defaults = {
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader><leader>"] = { name = "Prev buffer" },
    },
  },
}
