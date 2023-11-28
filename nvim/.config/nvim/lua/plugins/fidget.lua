return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.notify = opts.notify or {}
      opts.notify.enabled = true
      opts.notify.view = "mini"
    end,
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = function(_, opts)
      opts.top_down = false
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
      {
        "<leader>un",
        function()
          require("fidget").notification.reset()
        end,
        desc = "Dismiss all Notifications",
      },
    },
    init = function()
      vim.notify = require("fidget").notify
    end,
  },
}
