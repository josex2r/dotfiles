return {
  { "folke/lazy.nvim", version = "*" },

  {
    "LazyVim/LazyVim",
    priority = 10000,
    lazy = false,
    config = true,
    version = "*",
    opts = {
      colorscheme = "tokyonight-moon",
      -- colorscheme = "github_dark",
    },
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- measure startuptime
  {
    "dstein64/vim-startuptime",

    cmd = "StartupTime",

    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
