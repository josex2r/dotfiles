return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>z", group = "+folds" },
      },
    },
  },

  -- folds
  {
    "kevinhwang91/nvim-ufo",

    dependencies = {
      "kevinhwang91/promise-async",
    },

    opts = {
      provider_selector = function(bufnr, filetype)
        return { "treesitter", "indent" }
      end,
    },
  },
}
