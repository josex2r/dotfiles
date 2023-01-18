return {
  -- Peek lines ":<line_number>"
  { "nacro90/numb.nvim", config = true },

  -- Fast word jump
  {
    "ggandor/flit.nvim",

    dependencies = {
      "ggandor/leap.nvim",
    },

    config = true,

    init = function()
      require('leap').set_default_keymaps()
    end,
  },

  -- Navigate diagnostics
  {
    "folke/trouble.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    keys = {
      { "<leader>dd", "<cmd>TroubleToggle<cr>", desc = "Toggle" },
      { "<leader>dd", "<cmd>TroubleToggle loclist<cr>", desc = "Loclist" },
      { "<leader>dd", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
      { "<leader>dd", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
      { "<leader>dd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", desc = "LSP" },
      { "<leader>dd", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace" },
    },

    config = true,
  },

  -- Navigate TODO comments
  { "folke/todo-comments.nvim", config = true },

  -- Marks in files, lines, ...
  {
    "ThePrimeagen/harpoon",

    config = {
      enter_on_sendcmd = true,
    },

    keys = {
      {
        "<leader>ha",
        "lua require('harpoon.mark').add_file()",
        desc = "Add file",
      },
      {
        "<leader>hr",
        "lua require('harpoon.mark').remove_file()",
        desc = "Remove file",
      },
      {
        "<leader>ht",
        "lua require('harpoon.mark').toggle_file()",
        desc = "Toggle file",
      },
      {
        "<leader>hc",
        "lua require('harpoon.mark').clear_all()",
        desc = "Clear marks",
      },
      {
        "<leader>hh",
        "Telescope harpoon marks",
        desc = "Show marks",
      },
      {
        "<leader>hn",
        "lua require('harpoon.ui').nav_next()",
        desc = "Next mark",
      },
      {
        "<leader>hp",
        "lua require('harpoon.mark').nav_prev()",
        desc = "Prev mark",
      },
    },
  },
}
