return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          enabled = true,
          backend = "tmux", -- or "zellij"
        },
        win = {
          keys = {
            submit = {
              "<c-s>",
              function(t)
                t:send("\n")
              end,
            },
          },
        },
      },
    },
  },
}
