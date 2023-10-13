return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
      },
    },
  },

  -- Marks in files, lines, ...
  {
    "ThePrimeagen/harpoon",
    event = "BufReadPost",
    opts = {
      enter_on_sendcmd = true,
    },

    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add file",
      },
      {
        "<leader>hr",
        function()
          require("harpoon.mark").remove_file()
        end,
        desc = "Remove file",
      },
      {
        "<leader>ht",
        function()
          require("harpoon.mark").toggle_file()
        end,
        desc = "Toggle file",
      },
      {
        "<leader>hc",
        function()
          require("harpoon.mark").clear_all()
        end,
        desc = "Clear marks",
      },
      {
        "<leader>hh",
        "<cmd>Telescope harpoon marks<cr>",
        desc = "Show marks",
      },
      {
        "<leader>hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Next mark",
      },
      {
        "<leader>hp",
        function()
          require("harpoon.mark").nav_prev()
        end,
        desc = "Prev mark",
      },
    },

    init = function()
      require("telescope").load_extension("harpoon")
    end,
  },
}
