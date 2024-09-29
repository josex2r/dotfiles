return {
  "folke/which-key.nvim",
  optional = true,
  keys = {
    { "<leader><space>", "<C-^>", desc = "Prev buffer" },
  },
  opts = {
    notify = false,
    spec = {
      { "<leader><leader>", group = "Prev buffer" },
      { "<leader>cv", group = "Copilot", icon = "" },
    },
  },
}
