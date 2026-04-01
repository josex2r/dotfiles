return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          enabled = true,
          backend = "tmux", -- or "zellij"
          create = "split",
        },
        tools = {
          copilot = { cmd = { "copilot", "--banner" } },
          -- copilot = { cmd = { "copilot", "--banner", "--alt-screen" } },
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
