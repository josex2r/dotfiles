return {
  "gbprod/yanky.nvim",
  keys = {
    { "<leader>p", false },
    {
      "<leader>y",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      desc = "Open Yank History",
    },
  },
}
