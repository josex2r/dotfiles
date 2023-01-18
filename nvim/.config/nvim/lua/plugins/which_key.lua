return {
  "folke/which-key.nvim",

  lazy = false,

  config = {
    enable = true,
    layout = {
      height = { min = 4, max = 15 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
  },

  init = function()
    local wk = require('which-key')

    wk.register({
      b = 'Buffer',
      c = 'Coding',
      d = 'Diagnostics',
      f = 'Files',
      g = 'Git',
      h = 'Harpoon',
      l = "Lazy (plugins)",
      n = "Remove search (:noh)",
      P = "Buffer picker",
      q = 'Quickfix',
      s = 'Search',
      t = "Toggle Tree",
      u = 'Toggle Config',
      v = 'Vim Config',
      w = { "Save File" },
      x = 'Dap Breakpoints',
      z = 'Dap debug',
      ["<space>"] = "Go to prev Buffer",
    }, { prefix = "<leader>" })
  end,
}
