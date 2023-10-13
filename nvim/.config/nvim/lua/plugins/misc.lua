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

      -- map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Go to left window", remap = true })
      -- map("n", "<C-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Go to left window", remap = true })
      -- map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Go to bottom window", remap = true })
      -- map("n", "<C-Down>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Go to bottom window", remap = true })
      -- map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Go to top window", remap = true })
      -- map("n", "<C-Up>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Go to top window", remap = true })
      -- map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Go to right window", remap = true })
      -- map("n", "<C-Right>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Go to right window", remap = true })
    end,
  },
}
