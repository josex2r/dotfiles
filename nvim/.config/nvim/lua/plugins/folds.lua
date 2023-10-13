return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>z"] = { name = "+folds" },
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
