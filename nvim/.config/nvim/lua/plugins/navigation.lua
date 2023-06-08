return {
  -- Peek lines ":<line_number>"
  { "nacro90/numb.nvim", config = true },

  -- Fast word jump
  {
    "ggandor/leap.nvim",

    event = "VeryLazy",

    dependencies = {
      { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
    },

    config = function(_, opts)
      local leap = require("leap")

      for k, v in pairs(opts) do
        leap.opts[k] = v
      end

      leap.add_default_mappings(true)
    end,
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      { "<leader>xtt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo Trouble" },
      { "<leader>xT", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
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

  -- tmux
  {
    "alexghergh/nvim-tmux-navigation",

    --   keys = {
    --     {
    --       "<C-h>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
    --       end,
    --       desc = "Go to left window",
    --     },
    --     {
    --       "<C-j>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateDown()
    --       end,
    --       desc = "Go to lower window",
    --     },
    --     {
    --       "<C-k>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateUp()
    --       end,
    --       desc = "Go to upper window",
    --     },
    --     {
    --       "<C-l>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateRight()
    --       end,
    --       desc = "Go to right window",
    --     },
    --     {
    --       "<C-Left>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
    --       end,
    --       desc = "Go to left window",
    --     },
    --     {
    --       "<C-Down>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateDown()
    --       end,
    --       desc = "Go to lower window",
    --     },
    --     {
    --       "<C-Up>",
    --       function()
    --         print("up!!")
    --         require("nvim-tmux-navigation").NvimTmuxNavigateUp()
    --       end,
    --       desc = "Go to upper window",
    --     },
    --     {
    --       "<C-Right>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateRight()
    --       end,
    --       desc = "Go to right window",
    --     },
    --     {
    --       "<C-\\>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()
    --       end,
    --       desc = "Go to last window",
    --     },
    --     {
    --       "<C-Space>",
    --       function()
    --         require("nvim-tmux-navigation").NvimTmuxNavigateNext()
    --       end,
    --       desc = "Go to next window",
    --     },
    --   },
    --
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = false,
      })
    end,
  },
}
