return {
  -- A plugin to place, toggle and display marks
  "kshenoy/vim-signature",

  -- Read ".editorconfig" file
  "gpanders/editorconfig.nvim",

  -- Better Quick Fix window
  "kevinhwang91/nvim-bqf",

  -- Peek lines ":<line_number>"
  { "nacro90/numb.nvim", config = true },

  -- tmux
  {
    "alexghergh/nvim-tmux-navigation",

    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      local keymap = require("utils.keymap")
      local map = keymap.map

      nvim_tmux_nav.setup({
        disable_when_zoomed = false,
      })

      -- Window navigation keymaps are set in config/keymaps.lua (loaded after
      -- LazyVim's defaults, so they correctly override <C-h/j/k/l>).
    end,
  },

  -- makes some plugins dot-repeatable
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {},
  -- },
}
